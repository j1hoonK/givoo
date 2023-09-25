import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> orgTypeList = ["국제구제","자선","교육만화과학","경제활동","환경보전","권익신장","보건복지","국제교류협력","시민사회구축","기타"];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.03,),
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
            Container(
              margin: EdgeInsets.all(10),
              height: height*0.33,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orgTypeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, //1 개의 행에 보여줄 item 개수
                  childAspectRatio: 1 / 1.8, //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 10, //수평 Padding
                  crossAxisSpacing: 10, //수직 Padding
                ),itemBuilder: (context, idx){
                  return InkWell(
                    onTap: (){
                      context.push("/Recommend",extra: orgTypeList[idx]);
                      Provider.of<RecommendMoreProvider>(context, listen: false).fetchApi(orgTypeList[idx]);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: height*0.1,
                            color: Colors.black,
                          ),
                          Container(
                            height: height*.03,
                            child: Text("${orgTypeList[idx]}"),
                          )
                        ],
                      ),
                    ),
                  );
              },
              ),
            ),  Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: width * 0.05),
              child: Text(
                "이런 기관은 어떠세요?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),Consumer<OrganizationProvider>(
                builder: (context,provider,child){
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: height*0.25,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:provider.randomOrgList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        //  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 10, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      itemBuilder: (context,idx) {
                        return OrgBox(orgName: provider.randomOrgList[idx].orgName,
                          orgAddress: provider.randomOrgList[idx].orgAddress,
                          imagePath: provider.randomOrgList[idx].imagePath == null ? "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png":provider.randomOrgList[idx].imagePath,
                          orgId: provider.randomOrgList[idx].orgId,
                        );
                      },
                    ),
                  );

                }
            ),
            Container(
              height: height*0.2,
              color: Colors.black,
                      ),
          ],
        ),
      ),
    );
  }
}
