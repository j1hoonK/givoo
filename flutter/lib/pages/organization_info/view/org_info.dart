import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/com_org_info.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/organization_info/viewmodel/google_map.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/org_notice_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../provider/DonationProvider.dart';
import '../../../services/LaunchUrlService.dart';
import '../../pay/view/pay.dart';
import 'notice_org.dart';

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
        body: DefaultTabController(
          length: 3,
          child: Consumer<OrganizationProvider>(
            builder: (context, provider, child) => NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: provider.imagePath.isEmpty
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: mHeight * 28,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('images/login/mainlogo.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: mHeight * 28,
                              child: Image.network(
                                provider.imagePath[0],
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                            color: Colors.black,
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 2.0),
                            )),
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(text: "기관 정보"),
                          Tab(text: "공지 사항"),
                          Tab(text: "후원 하기"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: provider.orgInfodata.isEmpty
                  ? SizedBox(
                      height: height * 0.7,
                      child: Center(child: CircularProgressIndicator()))
                  : TabBarView(children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(mSize * 2.5,
                                  mHeight * 1, mSize * 2.5, mHeight * 1),
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
                                                      widget.orgId, LoginViewModel.userId);
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
                                  SizedBox(
                                    height: mHeight * 1.5,
                                  ),
                                  Card(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
                                                child: Icon(Icons.phone,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                provider.orgInfodata['orgTell'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
                                                child: Icon(Icons.location_on,
                                                    color: Colors.grey),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  provider.orgInfodata[
                                                      'orgAddress'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                    "단체 소개",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: mHeight * 2,
                                  ),
                                  Text(
                                    provider.orgInfodata['orgInfo'] == null
                                        ? '-'
                                        : "${provider.orgInfodata['orgInfo']}",
                                    // "2009년, 내 주변에 있는 작은 자들에게 어떤 도움을 주며 살아가야하는가를 고민하며 설립된 월드휴먼브리지.\n큰 규모의 단체를 추구하기보다는 작은 사업이라도 투명하게 운영하는 체계를 갖추고,여러 교단의 교회가 하나되어 함께 하나님의 일을 해나가는 NGO단체입니다.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Divider(thickness: 1, height: mHeight * 3),
                                  Text(
                                    "단체 정보",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: mHeight * 2,
                                  ),
                                  Column(
                                    children: [
                                      SubTitle(title1: "대표자", title2: "고유번호"),
                                      SizedBox(
                                        height: mHeight * 0.3,
                                      ),
                                      SubSentence(
                                          sentence1:
                                              "${provider.orgInfodata['orgOwner']}",
                                          sentence2: provider.orgInfodata[
                                                      'orgOwnNumber'] ==
                                                  null
                                              ? "-"
                                              : "${provider.orgInfodata['orgOwnNumber']}")
                                    ],
                                  ),
                                  SizedBox(height: mHeight * 1),
                                  Column(
                                    children: [
                                      SubTitle(title1: "공익사업유형", title2: "설립일"),
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
                                      SubTitle(title1: "전화번호", title2: ""),
                                      SizedBox(height: mHeight * 0.3),
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
                                              color: Palette.textColor2)),
                                      SizedBox(height: mHeight * 0.3),
                                      Text(
                                          "${provider.orgInfodata['orgAddress']}")
                                    ],
                                  ),
                                  Divider(thickness: 1, height: mHeight * 3),
                                  Text(
                                    "단체 위치",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: mHeight * 2,
                                  ),
                                  provider.orgInfodata.isNotEmpty
                                      ? Container(
                                          width: double.infinity,
                                          height: mHeight * 25,
                                          color: Colors.grey,
                                          child: NowGoogleMapView(
                                              latitude: mapp
                                                  .orgInfodata['locationLat'],
                                              //provider.orgInfodata['locationLat'],
                                              longitude: mapp
                                                  .orgInfodata['locationLong'],
                                              //provider.orgInfodata['locationLong'],
                                              orgName:
                                                  "${provider.orgInfodata['orgName']}"),
                                        )
                                      : CircularProgressIndicator(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Consumer<OrgNoticeProvider>(
                        builder: (context, prvv, child) => ListView.separated(
                          itemCount: prvv.orgNoticeList.length+1,
                          itemBuilder: (context, index) =>
                          index == 0
                          ? Padding(
                            padding: EdgeInsets.fromLTRB(mSize * 2.5,
                                mHeight * 1, mSize * 2.5, mHeight * 1),
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
                                                widget.orgId, LoginViewModel.userId);
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
                            ),]),
                          )
                              :OrgNotice(
                            title: prvv.orgNoticeList[index-1].subject,
                            date: prvv.orgNoticeList[index-1].noticeDate,
                            content: prvv.orgNoticeList[index-1].contents,
                          ), separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                        },
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(mSize * 2.5,
                                  mHeight * 1, mSize * 2.5, mHeight * 1),
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
                                                      widget.orgId, LoginViewModel.userId);
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
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Pay(orgId: widget.orgId),
                                ],
                              ))
                        ]),
                      )
                    ]),
            ),
          ),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
