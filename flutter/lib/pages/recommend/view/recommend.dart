import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:provider/provider.dart';

class Recommend extends StatefulWidget {
  const Recommend({super.key});
  @override
  State<Recommend> createState() => _RecommendState();
}
class _RecommendState extends State<Recommend> {
  @override
  void initState(){
    super.initState();
    Provider.of<RecommendMoreProvider>(context, listen: false).fetchApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(title: "종교단체"),
      body: Consumer<RecommendMoreProvider>(
        builder:(context,provider,child){
          return Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [Container(
                height: 20,
             //   child:Row ,
              ),
                SizedBox(
                  height: 600,
                  child: GridView.builder(
                          itemCount: provider.orgList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 1 / 1.23, //item 의 가로 1, 세로 2 의 비율
                            mainAxisSpacing: 10, //수평 Padding
//   crossAxisSpacing: 10, //수직 Padding
                          ),
                          itemBuilder: (BuildContext context, int idx){
                            print("${provider.orgList.length}");
                            return OrgBox(orgName: provider.orgList[idx].orgName,
                              orgAddress: provider.orgList[idx].orgAddress,
                              orgPath: provider.orgList[idx].imagePath,);
                          }
                      ),

                ),
              ],
            ),
          );
        } ,
      ),

      );
  }
}
