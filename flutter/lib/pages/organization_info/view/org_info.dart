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
                            SubSentence(
                                sentence1: "${provider.orgInfodata['orgOwner']}",
                                sentence2: "${provider.orgInfodata['orgOwnNumber']}")
                          ],
                        ),
                        SizedBox(height: mHeight * 1),
                        Column(
                          children: [
                            SubTitle(title1: "공익사업유형", title2: "설립일"),
                            SizedBox(height: mHeight * 0.3,),
                            SubSentence(
                                sentence1: "${provider.orgInfodata['orgType']}",
                                sentence2: "${provider.orgInfodata['startedUp']}"),
                          ],
                        ),
                        SizedBox(height: mHeight * 1),
                        Column(
                          children: [
                            SubTitle(title1: "전화번호", title2: ""),
                            SizedBox(height: mHeight * 0.3),
                            SubSentence(
                                sentence1: "${provider.orgInfodata['orgTell']}",
                                sentence2: "")
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
                            "모든 국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 통신·방송의 시설기준과 신문의 기능을 보장하기 위하여 필요한 사항은 법률로 정한다. 원장은 국회의 동의를 얻어 대통령이 임명하고, 그 임기는 4년으로 하며, 1차에 한하여 중임할 수 있다. 대통령은 필요하다고 인정할 때에는 외교·국방·통일 기타 국가안위에 관한 중요정책을 국민투표에 붙일 수 있다."),
                        Divider(thickness: 1, height: mHeight * 3),
                        Text(
                          "공지사항",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: mHeight * 1.5,
                        ),
                        provider.orgInfodata.isNotEmpty
                            ? CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            autoPlay: false, // 자동 슬라이드 활성화
                          ),
                          items: [
                            "법원은 최고법원인 대법원과 각급법원으로 조직된다.",
                            "국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다.",
                            "군인 또는 군무원이 아닌 국민은 대한민국의 영역안에서는 중대한 군사상 기밀·초병·초소·유독음식물공급·포로·군용물에 관한 죄중 법률이 정한 경우와 비상계엄이 선포된 경우를 제외하고는 군사법원의 재판을 받지 아니한다.",
                          ].map((notice) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                notice,
                                style: TextStyle(fontSize: 18),
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
