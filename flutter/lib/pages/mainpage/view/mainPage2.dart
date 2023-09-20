import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainPage2 extends StatelessWidget {
  const MainPage2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> orgTypeList = ["사회","복지","종교","의료","교육","기타"];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(title: "나눔 추천"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.05,),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20),
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
                  crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                  //  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
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
              margin: EdgeInsets.only(left: 20),
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
                      itemCount:provider.OrgList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        //  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 10, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      itemBuilder: (context,idx) {
                        return OrgBox(orgName: provider.OrgList[idx].orgName,
                          orgAddress: provider.OrgList[idx].orgAddress,
                          imagePath: provider.OrgList[idx].imagePath,
                          orgId: provider.OrgList[idx].orgId,
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
