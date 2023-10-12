import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


void main() { runApp(MyPageTerms());}
class MyPageTerms extends StatefulWidget {
  const MyPageTerms({Key? key}) : super(key: key);

  @override
  State<MyPageTerms> createState() => _MyPageTermsState();
}

class _MyPageTermsState extends State<MyPageTerms> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = -1;
  String _updateDate = '';

  @override
  void initState() {
    super.initState();
    _setUpdateDate();
  }

  void _setUpdateDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    setState(() {
      _updateDate = formattedDate;
    });
  }

  Widget title(String text, {double size = 14}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget description(String text, {int tabIn = 0}) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget gridView() {
    // 그리드 뷰 내용을 추가해주세요.
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // 양쪽에 패딩 추가
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                right: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          left: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Text(
                        '구분',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: Text('수집 이용항목',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                      ),
                      left: BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 119, //컨테이너 패딩
                          child: Text(
                            '회원가입',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                'sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입snsns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입snsns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입snsns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입sns 가입',
                                softWrap: true, // 줄 바꿈 설정
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                  ),
                                  left: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text('sns 가입'),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                  ),
                                  left: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text('sns 가입'),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                  ),
                                  left: BorderSide(
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text('sns 가입'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                          ),
                          left: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text('구분'),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                            ),
                            left: BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text('수집 이용항목'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 타이틀 중앙 정렬
        elevation: 0.0, // 앱바 하단 그림자 없애기
        title: Image.asset('images/login/logo.png',width: MediaQuery.of(context).size.width * 0.3),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.arrow_back, color: Colors.black,)),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '기부어때 이용약관 및 개인정보처리방침',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 15),
              const Center(
                child: Text(
                  '-이용약관-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '업데이트 날짜: $_updateDate',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),

              title('  제1장 총 칙', size: 15),
              const SizedBox(height: 10),
              title('  제1조 （이용약관）', size: 15),
              description(
                " 1. 기부어때 주식회사(이하, ‘당사’라고 함)가 실시하는 기부어때앱(이하, ‘본 앱’이라고 함)을 이용할 때는 이 기부어때앱의 이용규약(이하, ‘본 규약’이라고 함)에 동의한 후에 본 앱을 다운로드 받고, 본 규약을 준수해야 합니다. 본 규약은 본 앱을 이용하는 분들(이하, ‘이용자’라고 함)이 본 앱을 이용할 때 적용됩니다. 만약 동의하실 수 없다면 대단히 죄송하지만 이용을 삼가 주십시오.2. 본 규약 및 당사가 본 앱에 관해 본 앱상에 게시하거나 직접 이용자에게 개별적으로 연락하는 알림 등은 모두 본 규약과 통합된 것으로서 이용자는 이를 준수할 의무를 지닙니다.",
              ),
              const SizedBox(height: 10),
              description(
                " 2. 본 규약 및 당사가 본 앱에 관해 본 앱상에 게시하거나 직접 이용자에게 개별적으로 연락하는 알림 등은 모두 본 규약과 통합된 것으로서 이용자는 이를 준수할 의무를 지닙니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 10),
              title('  제2조 （본 규약의 변경）', size: 15),
              const SizedBox(height: 10),
              description(
                "1. 당사는 스스로 필요하다고 판단될 경우, 이용자의 동의를 얻지 않고 수시로 본 규약을 추가, 변경 및 삭제(이하, 총칭하여 ‘변경 등’이라고 함)할 수 있습니다.",
                tabIn: 2,
              ),
              description(
                " 2. 본 규약이 변경된 후에 이용자가 본 앱을 이용한 경우, 변경된 이후의 본 규약에 동의하신 것으로 간주합니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 10),
              title('  제2장 본 앱 및 이용자 등', size: 15),
              const SizedBox(height: 10),

              title('  제3조 （정의）', size: 15),
              description(
                " 1. 본 규약에서 ‘본 앱 콘텐츠’란 이용자 자신이 소유한 스마트폰 등의 휴대 정보 단말기에 당사가 제공하는 본 앱을 설치했을 때, 당사가 해당 휴대 정보 단말기에 제공하는 각종 정보(이하, ‘본 앱 관련 정보’라고 함)를 말합니다.",
                tabIn: 2,
              ),
              description(
                " 2. 이용자 전송 정보란 이용자가 본 앱상에서 당사에 전송하는 각종 정보 및 본 앱을 통해 이용자로부터 제공된 정보를 말합니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 10),

              title('  제4조 (본 앱의 다운로드)', size: 15),
              description(
                " 1. 본 앱의 이용을 희망하는 개인은 본 규약에 동의한 후, 본 앱을 자신이 소유한 휴대 정보 단말기에 본 앱 다운로드하기를 실행해야 합니다.",
                tabIn: 2,
              ),
              title('  제5조 （본 앱 이용에 관한 여러 조건）', size: 15),
              description(
                " 1. 이용자는 본 규약의 각 조항에 따라 본 앱을 위해 본 앱을 무상으로 사용할 독점적인 권리를 취득합니다.",
                tabIn: 2,
              ),
              description(
                " 2. 이용자는 본 앱을 제삼자에게 사용 허락, 대여 또는 리스할 수 없습니다.",
                tabIn: 2,
              ),
              description(
                " 3. 이용자는 본 앱의 전부 또는 일부를 복제, 변경 등을 할 수 없습니다.",
                tabIn: 2,
              ),
              description(
                " 4. 이용자는 본 앱의 리버스 엔지니어링, 역컴파일 또는 역어셈블을 할 수 없습니다.",
                tabIn: 2,
              ),
              description(
                " 5. 본 앱의 등록, 이용, 변경 및 이용 정지로 발생하는 통신비에 대해서는 이용자가 지불하며, 당사는 일체 부담하지 않습니다.",
                tabIn: 2,
              ),
              description(
                " 6. 본 앱에 게재되어 있는 캠페인 정보는 캠페인을 기획하고 있는 당사가 제공 또는 당사가 승인한 제삼자 기업의 캠페인 기획을 제공하고 있습니다.",
                tabIn: 2,
              ),

              title('  제6조 （본 앱의 콘텐츠 변경）', size: 15),
              description(
                " 1. 당사는 본 앱 콘텐츠의 내용 등을 변경할 수 있습니다. 또한, 변경 효력은 당사가 별도로 규정한 경우를 제외하고, 당사가 본 앱상에서 해당하는 본 앱 콘텐츠를 변경한 시점부터 발생합니다.",
                tabIn: 2,
              ),
              description(
                " 2. 전항에 의거하여 본 앱 콘텐츠의 내용 등이 변경된 경우, 이로 인해 발생한 이용자의 손해에 관해 당사는 일절 책임을 지지 않습니다.",
                tabIn: 2,
              ),
              title('  제7조 （본 앱의 이용 중단）', size: 15),
              description(
                " 1. 당사는 이하의 각호 중 어느 하나에 해당하는 사유가 발생한 것으로 판단한 경우, 이용자에게 사전 통보 없이, 본 앱의 전부 또는 일부 이용을 중단, 정지, 폐지 등(이하, 총칭하여 ‘중단 등’이라고 함)을 할 수 있습니다.",
                tabIn: 2,
              ),
              description(
                " 2. 여러 사정으로 본 앱을 지속적으로 제공하기 어려울 경우, 당사는 당사의 판단에 의해 이용자의 허가를 얻지 않고, 본 앱의 전부 또는 일부의 이용을 폐지할 수 있습니다.",
                tabIn: 2,
              ),
              description(
                "3. 당사는 전 2항 중 어느 하나 또는 그것과 유사한 사유로 인해 본 앱의 이용 중단 등으로 이용자 또는 제삼자가 입은 손해에 대해 일절 책임을 지지 않습니다.",
                tabIn: 2,
              ),
              title(' 제8조 （본 앱의 이용 정지）', size: 15),
              description(
                " 본 앱의 이용 정지를 원하는 이용자는 본 앱 내의 메뉴 또는 소정의 방법으로 본 앱을 제거함으로써, 이용을 정지할 수 있습니다.",
                tabIn: 2,
              ),
              title('  제3장 이용자의 책임과 의무', size: 15),
              const SizedBox(height: 10),
              title('  제10조 （금지 사항）', size: 15),
              description(
                "1. 이용자는 전조에서 규정한 행위 외에 아래의 각호 중 어느 하나에 해당하는 행위를 해서는 안 됩니다.",
              ),
              description(
                "(1)본 앱용 설비(당사 또는 당사가 지정한 본 앱을 제공하기 위해 준비하는 통신 설비, 통신 회선, 전자계산기, 기타 기기 및 소프트웨어를 포함)에 부정하게 접근하거나 이용 또는 운영에 지장을 주는 행위(이용의 통상 범위를 넘어서 서버에 부담을 주는 행위 포함)",
              ),
              description(
                "(2)휴대 정보 단말기를 부정하게 사용하거나 제삼자에게 부정한 사용을 유발시키는 행위",
              ),
              description(
                "(3)본 앱에 컴퓨터 바이러스 및 기타 유해한 컴퓨터 프로그램이 포함된 정보를 전송, 글쓰기 또는 게재하는 행위",
              ),
              description(
                "(4)다른 이용자 행세를 하여 본 앱을 이용하는 행위",
              ),
              description(
                "(5)본 앱을 부정하게 변경하는 행위",
              ),
              description(
                "(6)그 밖에 당사가 부적절, 부적당하다고 판단하는 행위",
              ),





              const SizedBox(height: 15),

              const SizedBox(height: 15),
              const Center(
                child: Text(
                  '-개인정보처리방침-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '업데이트 날짜: $_updateDate',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
//여기에 개인정보처리 방침
              const SizedBox(height: 10),
              description(
                "(주)기부어때(이하 '회사'라 합니다)는 개인정보 보호법 제 30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개 합니다.",
              ),
              const SizedBox(height: 15),
              title('  제1조 (개인정보의 처리 목적, 보유 기간 및 처리하는 개인정보 항목)', size: 15),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      '1. 기부어때 회원 관리 및 서비스 운영',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  // gridView() 함수 호출
                  gridView(),
                ],
              ),

              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      '2. 기부어때 회원 관리 및 서비스 운영',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  // gridView() 함수 호출
                  gridView(),
                  const SizedBox(height: 10),
                  description(
                    "(주)기부어때(이하 '회사'라 합니다)는 개인정보 보호법 제 30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개 합니다.",
                  ),
                  const SizedBox(height: 15),
                  title('  제2조 (개인정보의 처리 목적, 보유 기간 및 처리하는 개인정보 항목)', size: 15),
                  const SizedBox(height: 10),
                  description(
                    "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                  ),
                  const SizedBox(height: 10),
                  description(
                    "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                    tabIn: 2,
                  ),
                  const SizedBox(height: 10),
                  description(
                    "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                    tabIn: 2,
                  ),
                  const SizedBox(height: 10),
                  description(
                    "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                    tabIn: 2,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
