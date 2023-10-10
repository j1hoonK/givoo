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
    List<String> orgTypeList1 = [
      "국제구제",
      "자선",
      "교육문화과학",
      "경제활동",
      "환경보전",
      "권익신장",
    ];
    List<String> orgImageList1 = [
      "images/main/1.png",
      "images/main/2.png",
      "images/main/3.png",
      "images/main/4.png",
      "images/main/5.png",
      "images/main/6.png",
    ];

    List<String> orgTypeList2 = [
      "보건복지",
      "국제교류협력",
      "시민사회구축",
      "종교",
      "기타",
    ];
    List<String> orgImageList2 = [
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
            SizedBox(
              height: height * 0.03,
            ),
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
              height: height * 0.16, // 절반의 높이
              child: CarouselSlider(
                items: [
                  for (var idx = 0; idx < orgTypeList1.length; idx++)
                    Container(
                      child: InkWell(
                        onTap: () {
                          context.push("/Recommend", extra: orgTypeList1[idx]);
                          Provider.of<RecommendMoreProvider>(context, listen: false)
                              .fetchApi(orgTypeList1[idx]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.1,
                                child: Image.asset(orgImageList1[idx]),
                              ),
                              SizedBox(
                                height: height * 0.03,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(orgTypeList1[idx]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: height * 0.33,
                  autoPlay: false, // 자동 플레이 비활성화
                  enlargeCenterPage: false,//가운데 이미지만 크게 보이는 캐러셀,, 비활성화
                  viewportFraction: 0.24, //컨테이너 이미지 보이는 정도
                ),
              ),
            ),
            // 아래쪽 그리드뷰
            Container(
              // 국제구제, 자산
              margin: EdgeInsets.all(7),
              height: height * 0.16, // 절반의 높이
              child: CarouselSlider(
                items: [
                  for (var idx = 0; idx < orgTypeList2.length; idx++)
                    Container(
                      child: InkWell(
                        onTap: () {
                          context.push("/Recommend", extra: orgTypeList2[idx]);
                          Provider.of<RecommendMoreProvider>(context, listen: false)
                              .fetchApi(orgTypeList2[idx]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.1,
                                child: Image.asset(orgImageList2[idx]),
                              ),
                              SizedBox(
                                height: height * 0.03,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(orgTypeList2[idx]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: height * 0.33,
                  autoPlay: false, // 자동 플레이 비활성화
                  enlargeCenterPage: false,//가운데 이미지만 크게 보이는 캐러셀,, 비활성화
                  viewportFraction: 0.23,//컨테이너 이미지 보이는 정도
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02, // 조절하고 싶은 간격 값 설정
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "이런 기관은 어떠세요?",
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
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                height: height * 0.23,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.randomOrgList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3개의 행에 4개의 아이템 표시
                    childAspectRatio: 1 / 1.4, // item 의 가로 1, 세로 2 의 비율
                    mainAxisSpacing: 5, // 수평 Padding
                    crossAxisSpacing: 5, // 수직 Padding
                  ),
                  itemBuilder: (context, idx) {
                    return OrgBox(
                      orgName: provider.randomOrgList[idx].orgName,
                      orgAddress: provider.randomOrgList[idx].orgAddress,
                      imagePath: provider.randomOrgList[idx].imagePath ??
                          "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png",
                      orgId: provider.randomOrgList[idx].orgId,
                    );
                  },
                ),
              );
            }),
            SizedBox(
              height: height * 0.00, // 조절하고 싶은 간격 값 설정
            ),
            CarouselSlider(
              items: [
                Image.asset('images/main/b.jpg'),
                // Add more images here
              ],
              options: CarouselOptions(
                height: height * 0.4,
                autoPlay: true, // 자동 플레이 활성화
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
