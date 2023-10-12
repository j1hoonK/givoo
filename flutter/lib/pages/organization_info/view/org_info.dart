import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/com_org_info.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/organization_info/viewmodel/google_map.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/services/LaunchUrlService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrgInfo extends StatelessWidget {
  const OrgInfo({super.key,required this.orgId});
  final orgId;
  @override
  Widget build(BuildContext context) {
    var mapp = Provider.of<OrganizationProvider>(context);
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    return Scaffold(
      appBar: BaseAppbar(
        //  title: "상세정보",
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: mHeight * 4.3,
        color: Palette.mainColor,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Palette.mainColor),
            onPressed: () {
              context.push("/pay/$orgId");
            },
            child: Text(
              "후원하기",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<OrganizationProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Stack(
                    children: [
                      provider.imagePath.isEmpty? Container(
                        width: MediaQuery.of(context).size.width,
                        height: mHeight * 28,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/org/whb.png'), // 이미지 파일 경로
                            fit: BoxFit.fill,
                          ),
                        ),
                      ):Container(
                        width: MediaQuery.of(context).size.width,
                        height: mHeight * 28,
                        child: Image.network(
                          provider.imagePath[0], // 원격 이미지 URL
                          fit: BoxFit.fill, // 이미지의 맞춤 방식 (원하는 대로 변경 가능)
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, mSize * 2.5, mSize * 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  // 아이콘을 누를 때의 동작 (예: 언어 설정)
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("homepage: ${provider.orgInfodata['homepage']}");
                                  launchURL(provider.orgInfodata['homepage']);
                                },
                                child: Image.asset(
                                  'images/group/globe.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              GestureDetector(
                                onTap: () {
                                  if(provider.orgInfodata['favId']==0){
                                    provider.likeIsert(orgId, 1);
                                  }else{
                                    provider.likeToggle(provider.orgInfodata['favId']);
                                  }
                                },
                                child: Image.asset(
                                  provider.isFollowSelected==1
                                      ? 'images/group/follow_y.png' // 선택된 이미지 파일 경로
                                      : 'images/group/follow_n.png', // 일반 이미지 파일 경로
                                  width: 24.0,
                                  height: 24.0,
                                  // 이미지 색상 설정 (선택 사항)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            mSize * 2.5, mHeight * 1.5, mSize * 2.5, mHeight * 1),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color:Color(0xFFFCF4EF),
                                  borderRadius: BorderRadius.circular(20), // 둥근 모서리 설정
                                ),
                                child: Center(child: Text(provider.orgInfodata['orgType'],
                                  style:TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  provider.orgInfodata['orgName'],
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: mHeight * 1.5,
                              ),Card(
                                margin: EdgeInsets.only(top: 10),
                                child:SizedBox(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        child: Icon(Icons.location_on,color:Colors.grey),),
                                        Container(
                                          child: Text(provider.orgInfodata['orgAddress']
                                            ,style: TextStyle(
                                            fontWeight: FontWeight.bold,),
                                      ),),],
                                    ),
                                      Row(
                                      children: [Container(
                                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        child: Icon(Icons.phone,color:Colors.grey),),
                                        Container(
                                          child: Text(provider.orgInfodata['orgTell'],
                                            style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        )],
                                    )],
                                  ),
                                ) ,
                              ),SizedBox(
                                height: 40,
                              ),Container(
                                child:Text(//"${provider.orgInfodata['orgInfo']}"
                                    "모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. "
                                        "통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. "
                                        "원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다."
                                        " 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다.",
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                              ),SizedBox(
                                height: 40,
                              ),
                              Divider(thickness: 1, height: mHeight * 3),
                              Column(
                                children: [
                                  SubTitle(title1: "대표자", title2: "고유번호"),
                                  SizedBox(height: mHeight * 0.3,),
                                  SubSentence(sentence1: "${provider.orgInfodata['orgOwner']}", sentence2: provider.orgInfodata['orgOwnNumber'] ==null? "-" : "${provider.orgInfodata['orgOwnNumber']}")
                                ],
                              ),
                              SizedBox(height: mHeight * 1),
                              Column(
                                children: [
                                  SubTitle(title1: "공익사업유형", title2: "설립일"),
                                  SizedBox(height: mHeight * 0.3,),
                                  SubSentence(sentence1: "${provider.orgInfodata['orgType']}", sentence2: "${provider.orgInfodata['startedUp']}"),
                                ],
                              ),
                              SizedBox(height: mHeight * 1),
                              Column(
                                children: [
                                  SubTitle(title1: "전화번호", title2: ""),
                                  SizedBox(height: mHeight * 0.3),
                                  SubSentence(sentence1: "${provider.orgInfodata['orgTell']}", sentence2: "")
                                ],
                              ),
                              SizedBox(height: mHeight * 1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("소재지", style: TextStyle(color: Palette.textColor2)),
                                  SizedBox(height: mHeight * 0.3),
                                  Text("${provider.orgInfodata['orgAddress']}")
                                ],
                              ),


                              Divider(thickness: 1, height: mHeight * 3),
                              Text(
                                "공지사항",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: mHeight * 1.5,
                              ),
                              Text(//"${provider.orgInfodata['orgNotice']}"
                                  "법원은 최고법원인 대법원과 각급법원으로 조직된다. 국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다."),
                              Divider(thickness: 1, height: mHeight * 3),
                              Text(
                                "단체 위치",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: mHeight * 1,
                              ),
                            ])),
                  ),
                  provider.orgInfodata.isNotEmpty ? Container(
                    width: double.infinity,
                    height: mHeight * 25,
                    color: Colors.grey,
                    child:NowGoogleMapView(latitude:mapp.orgInfodata['locationLat'],//provider.orgInfodata['locationLat'],
                        longitude: mapp.orgInfodata['locationLong'],//provider.orgInfodata['locationLong'],
                        orgName: "${provider.orgInfodata['orgName']}"),
                  ) : CircularProgressIndicator(),
                ],
              );
            }
        ),
      ),
    );;
  }
}
