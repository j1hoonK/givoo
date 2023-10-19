import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/com_org_info.dart';
import 'package:givoo/component/view/togglebutton.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/organization_info/viewmodel/google_map.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/services/LaunchUrlService.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../provider/DonationProvider.dart';
import '../../mypage/view/notice.dart';
import '../../pay/view/pay.dart';

class OrgInfo extends StatefulWidget {
  const OrgInfo({super.key, required this.orgId});

  final orgId;

  @override
  State<OrgInfo> createState() => _OrgInfoState();
}

var isSelected = [true, false, false];

class _OrgInfoState extends State<OrgInfo> {
  @override
  void initState() {
    Provider.of<DonationProvider>(context, listen: false)
        .loadDonationType(widget.orgId);
    setState(() {
      isSelected = [true, false, false];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mapp = Provider.of<OrganizationProvider>(context);
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
            Consumer<OrganizationProvider>(builder: (context, provider, child) {
          return provider.orgInfodata.isEmpty
              ? Container(
                  height: height * 0.7,
                  child: Center(child: CircularProgressIndicator()))
              : Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Stack(
                      children: [
                        provider.imagePath.isEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: mHeight * 28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/org/whb.png'),
                                    // 이미지 파일 경로
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: mHeight * 28,
                                child: Image.network(
                                  provider.imagePath[0], // 원격 이미지 URL
                                  fit: BoxFit.fill, // 이미지의 맞춤 방식 (원하는 대로 변경 가능)
                                ),
                              ),
                      ],
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: ToggleButtons(
                        constraints: BoxConstraints.expand(
                            width:
                                MediaQuery.of(context).size.width / 3 - 4 / 3),
                        borderColor: Colors.black,
                        fillColor: Colors.black,
                        borderWidth: 1,
                        selectedBorderColor: Colors.black,
                        selectedColor: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i == index;
                            }
                          });
                          print(index);
                          print(isSelected[2]);
                        },
                        isSelected: isSelected,
                        children: [
                          OrgToggle(text: '기관 정보'),
                          OrgToggle(text: '공지 사항'),
                          OrgToggle(text: '후원 하기'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(mSize * 2.5, mHeight * 1,
                              mSize * 2.5, mHeight * 1),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFE6D3),
                                        borderRadius: BorderRadius.circular(
                                            15), // 둥근 모서리 설정
                                      ),
                                      child: Center(
                                        child: Text(
                                          provider.orgInfodata['orgType'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, mSize * 0.1, mSize * 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.phone,
                                              color: Colors.black,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              final tellNum = provider
                                                  .orgInfodata['orgTell'];
                                              final url =
                                                  Uri.parse("tel:$tellNum");
                                              try {
                                                await launchUrl(url);
                                              } on Exception catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '연결이 불가능합니다.\n등록된 번호: $tellNum'),
                                                  action: SnackBarAction(
                                                      label: "닫기",
                                                      onPressed: () {}),
                                                ));
                                                print(e);
                                              }
                                            },
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print(
                                                  "homepage: ${provider.orgInfodata['homepage']}");
                                              launchURL(provider
                                                  .orgInfodata['homepage']);
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
                                              if (provider
                                                      .orgInfodata['favId'] ==
                                                  0) {
                                                provider.likeIsert(
                                                    widget.orgId, 1);
                                              } else {
                                                provider.likeToggle(provider
                                                    .orgInfodata['favId']);
                                              }
                                            },
                                            child: Image.asset(
                                              provider.isFollowSelected == 1
                                                  ? 'images/group/follow_y.png' // 선택된 이미지 파일 경로
                                                  : 'images/group/follow_n.png',
                                              // 일반 이미지 파일 경로
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
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    provider.orgInfodata['orgName'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // var isSelected = [true, false, false];
                                isSelected[1]
                                    ?
                                Container(
                                  height: MediaQuery.of(context).size.height, //전체 스크롤 가능
                                    child: Notice())
                                           //공지사항 연결 사이즈 설정
                                    : isSelected[2]
                                        ? Pay(orgId: widget.orgId)
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: mHeight * 1.5,
                                              ),
                                              Card(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(10, 5,
                                                                    10, 5),
                                                            child: Icon(
                                                                Icons.phone,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            provider.orgInfodata[
                                                                'orgTell'],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(10, 5,
                                                                    10, 5),
                                                            child: Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              provider.orgInfodata[
                                                                  'orgAddress'],
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Text(
                                                //"${provider.orgInfodata['orgInfo']}"
                                                "2009년, 내 주변에 있는 작은 자들에게 어떤 도움을 주며 살아가야하는가를 고민하며 설립된 월드휴먼브리지.\n큰 규모의 단체를 추구하기보다는 작은 사업이라도 투명하게 운영하는 체계를 갖추고,여러 교단의 교회가 하나되어 함께 하나님의 일을 해나가는 NGO단체입니다.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Divider(
                                                  thickness: 1,
                                                  height: mHeight * 3),
                                              Column(
                                                children: [
                                                  SubTitle(
                                                      title1: "대표자",
                                                      title2: "고유번호"),
                                                  SizedBox(
                                                    height: mHeight * 0.3,
                                                  ),
                                                  SubSentence(
                                                      sentence1:
                                                          "${provider.orgInfodata['orgOwner']}",
                                                      sentence2: provider
                                                                      .orgInfodata[
                                                                  'orgOwnNumber'] ==
                                                              null
                                                          ? "-"
                                                          : "${provider.orgInfodata['orgOwnNumber']}")
                                                ],
                                              ),
                                              SizedBox(height: mHeight * 1),
                                              Column(
                                                children: [
                                                  SubTitle(
                                                      title1: "공익사업유형",
                                                      title2: "설립일"),
                                                  SizedBox(
                                                    height: mHeight * 0.3,
                                                  ),
                                                  SubSentence(
                                                      sentence1:
                                                          "${provider.orgInfodata['orgType']}",
                                                      sentence2:
                                                          "${provider.orgInfodata['startedUp']}"),
                                                ],
                                              ),
                                              SizedBox(height: mHeight * 1),
                                              Column(
                                                children: [
                                                  SubTitle(
                                                      title1: "전화번호",
                                                      title2: ""),
                                                  SizedBox(
                                                      height: mHeight * 0.3),
                                                  SubSentence(
                                                      sentence1:
                                                          "${provider.orgInfodata['orgTell']}",
                                                      sentence2: "")
                                                ],
                                              ),
                                              SizedBox(height: mHeight * 1),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("소재지",
                                                      style: TextStyle(
                                                          color: Palette
                                                              .textColor2)),
                                                  SizedBox(
                                                      height: mHeight * 0.3),
                                                  Text(
                                                      "${provider.orgInfodata['orgAddress']}")
                                                ],
                                              ),
                                              Divider(
                                                  thickness: 1,
                                                  height: mHeight * 3),
                                              Text(
                                                "공지사항",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: mHeight * 1.5,
                                              ),
                                              Text(
                                                  //"${provider.orgInfodata['orgNotice']}"
                                                  "안녕하세요, 공모사업에 참여해주신 모든 기관 및 청년분들에게 감사인사 드립니다.\n이번 공모사업 진행 시 40여개의 기관, 15분의 개인에게서 문의 및 신청이 있었습니다. 신청하신 모든 청년분들에게 지원해드리고 싶으나 그러하지 못한 점 양해바랍니다."
                                                  "\n또한 자립준비청년이 가장 많이 독립하는 시기인 내년 2-3월에  동일한 사업을 계획하고 있으니 많은 관심바랍니다.^^"),
                                              Divider(
                                                  thickness: 1,
                                                  height: mHeight * 3),
                                              Text(
                                                "단체 위치",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: mHeight * 1,
                                              ),
                                              provider.orgInfodata.isNotEmpty
                                                  ? Container(
                                                      width: double.infinity,
                                                      height: mHeight * 25,
                                                      color: Colors.grey,
                                                      child: NowGoogleMapView(
                                                          latitude: mapp
                                                                  .orgInfodata[
                                                              'locationLat'],
                                                          //provider.orgInfodata['locationLat'],
                                                          longitude: mapp
                                                                  .orgInfodata[
                                                              'locationLong'],
                                                          //provider.orgInfodata['locationLong'],
                                                          orgName:
                                                              "${provider.orgInfodata['orgName']}"),
                                                    )
                                                  : CircularProgressIndicator(),
                                            ],
                                          ),
                              ])),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
