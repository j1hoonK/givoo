import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    List<String> orgTypeList1 = [
      "국제구제",
      "자선",
      "교육문화과학",
      "경제활동",
      "환경보전",
      "권익신장",
      "보건복지",
      "국제교류협력",
      "시민사회구축",
      "종교",
      "기타",
    ];
    List<String> orgImageList1 = [
      "images/main/1.png",
      "images/main/2.png",
      "images/main/3.png",
      "images/main/4.png",
      "images/main/5.png",
      "images/main/6.png",
      "images/main/7.png",
      "images/main/8.png",
      "images/main/9.png",
      "images/main/10.png",
      "images/main/etc.png",
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: width * 0.05),
              child: Text(
                "후원 기관 보기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            // 위쪽 그리드뷰
            Container(
              margin: EdgeInsets.all(7),
              height: height * 0.15, // Card의 높이 늘림
              child: CarouselSlider(
                items: [
                  for (var idx = 0; idx < orgTypeList1.length; idx++)
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: InkWell(
                        onTap: () {
                          context.push("/Recommend", extra: orgTypeList1[idx]);
                          Provider.of<RecommendMoreProvider>(context, listen: false)
                              .fetchApi(orgTypeList1[idx]);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.10,// 이미지 높이 늘림
                              width: width * 0.4,// 이미지 높이 늘림
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 3.0,
                                ),
                                shape: BoxShape.circle, // 배경 색상 지정
                                image: DecorationImage(
                                  image:AssetImage(orgImageList1[idx]),
                                )
                              ),
                            ),SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: height * 0.02,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(orgTypeList1[idx],
                                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),//text크기 조절
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: height * 0.5,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  viewportFraction: 0.23,
                ),
              ),
            ),
            // 아래쪽 그리드뷰
            Divider(thickness: 1, height: mHeight * 3),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "이런 기관은 어떠세요",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<OrganizationProvider>(context, listen: false).randomOrg();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<OrganizationProvider>(builder: (context, provider, child) {
              return Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                // height: height * 0.23,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.randomOrgList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, idx) {
                    return provider.orgImageList.length <= idx ? Center(child: CircularProgressIndicator()) :OrgBox(
                      orgName: provider.randomOrgList[idx].orgName,
                      orgAddress: provider.randomOrgList[idx].orgAddress,
                      imagePath: provider.orgImageList[idx]!="" ? provider.orgImageList[idx] :
                          "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png",
                      orgId: provider.randomOrgList[idx].orgId,
                    );
                  },
                ),
              );
            }),
            Divider(thickness: 1, height: mHeight * 3),
            CarouselSlider(
              items: [
                Image.asset('images/main/a.jpg'),
                Image.asset('images/main/b.jpg'),
                Image.asset('images/main/c.jpg')
              ],
              options: CarouselOptions(
                height: height * 0.4,
                autoPlay: true,
                // enlargeCenterPage: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
