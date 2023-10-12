import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // 캐러셀 슬라이더 패키지 추가
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/com_org_info.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/organization_info/viewmodel/google_map.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/services/LaunchUrlService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrgInfo extends StatelessWidget {
  const OrgInfo({Key? key, required this.orgId}) : super(key: key);
  final orgId;

  @override
  Widget build(BuildContext context) {
    var mapp = Provider.of<OrganizationProvider>(context);
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    return Scaffold(
      appBar: BaseAppbar(
        // title: "상세정보",
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: mHeight * 4.3,
        color: Palette.mainColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Palette.mainColor),
          onPressed: () {
            context.go('/pay/$orgId');
          },
          child: Text(
            "후원하기",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: mHeight * 28,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/org/whb.png'), // 이미지 파일 경로
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: mSize * 28,
                        padding: EdgeInsets.all(mSize * 2.1),
                        color: Colors.black12.withOpacity(0), // 투명도 설정
                        child: Text(
                          '${provider.orgInfodata['orgName']}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, mSize * 2.5, mSize * 1),
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
                                if (provider.orgInfodata['favId'] == 0) {
                                  provider.likeIsert(orgId, 1);
                                } else {
                                  provider.likeToggle(provider.orgInfodata['favId']);
                                }
                              },
                              child: Image.asset(
                                provider.isFollowSelected == 1
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
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            mSize * 2.5, mHeight * 3, mSize * 2.5, mHeight * 1),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "단체 정보",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: mHeight * 1.5,
                              ),
                              Column(
                                children: [
                                  SubTitle(title1: "대표자", title2: "고유번호"),
                                  SizedBox(height: mHeight * 0.3,),
                                  SubSentence(sentence1: "${provider.orgInfodata['orgOwner']}", sentence2: "${provider.orgInfodata['orgOwnNumber']}")
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
                                "단체 소개",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: mHeight * 1.5,
                              ),
                              Text(//"${provider.orgInfodata['orgInfo']}"
                                  "안녕하세요, 공모사업에 참여해주신 모든 기관 및 청년분들에게 감사인사 드립니다.\n이번 공모사업 진행 시 40여개의 기관, 15분의 개인에게서 문의 및 신청이 있었습니다. 신청하신 모든 청년분들에게 지원해드리고 싶으나 그러하지 못한 점 양해바랍니다."
                                      "\n또한 자립준비청년이 가장 많이 독립하는 시기인 내년 2-3월에  동일한 사업을 계획하고 있으니 많은 관심바랍니다.^^"),
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
                                  "2009년, 내 주변에 있는 작은 자들에게 어떤 도움을 주며 살아가야하는가를 고민하며 설립된 월드휴먼브리지.\n큰 규모의 단체를 추구하기보다는 작은 사업이라도 투명하게 운영하는 체계를 갖추고,여러 교단의 교회가 하나되어 함께 하나님의 일을 해나가는 NGO단체입니다."),
                              Divider(thickness: 1, height: mHeight * 3),
                              Text(
                                "단체 위치",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: mHeight * 1,
                              ),
                            );
                          }).toList(),
                        )
                            : CircularProgressIndicator(),
                        provider.orgInfodata.isNotEmpty ? Container(
                          width: double.infinity,
                          height: mHeight * 25,
                          color: Colors.grey,
                          child: NowGoogleMapView(latitude:mapp.orgInfodata['locationLat'],//provider.orgInfodata['locationLat'],
                              longitude: mapp.orgInfodata['locationLong'],//provider.orgInfodata['locationLong'],
                              orgName: "${provider.orgInfodata['orgName']}"),
                        ) : CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
