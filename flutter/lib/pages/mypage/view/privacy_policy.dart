import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

void main() { runApp(PrivacyPolicy());}
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
  int _selectedItemIndex = -1; // 선택한 항목의 인덱스를 저장
  String _updateDate = ''; // 업데이트된 날짜를 저장할 변수

  @override
  void initState() {
    super.initState();
    _setUpdateDate(); // 업데이트된 날짜 설정
  }

  void _setUpdateDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    setState(() {
      _updateDate = formattedDate;
    });
  }

  Widget title(String text, {double size = 14}) {
    // title 위젯
    return Padding(
      padding: const EdgeInsets.all(20.0), // 왼쪽 패딩 설정
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
    // description 위젯
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                      width: 180,
                      height: 120,
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
                        '개인정보의 처리 목적',
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
                        child: Text('- 회원 가입 의사 확인\n'
                            '- 회원자격 유지·관리\n'
                            '- 서비스 부정 이용 방지\n'
                           ' - 각종 고지·통지\n'
                            '- 고충 처리\n',
                            ),
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
                          width: 180, //컨테이너 패딩
                          child: Text(
                            '  개인정보의 처리 및 보유 기간',
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
                                '- 서비스 탈퇴 시까지/n'
                                '- 다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지/n'
                              '가. 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우에는 해당 수사·조사 종료 시까지/n'
                              '나. 통신비밀보호법 시행령 제41조2항에 따른 통신사실확인자료/n'
                              '· 컴퓨터 통신 또는 인터넷의 로그 기록자료: 3개월/n',
                                softWrap: true, // 줄 바꿈 설정
                              ),
                            ),


                            // Container( //표 안에 칸 넣기
                            //   decoration: BoxDecoration(
                            //     border: Border(
                            //       top: BorderSide(
                            //         width: 1,
                            //       ),
                            //       left: BorderSide(
                            //         width: 1,
                            //       ),
                            //     ),
                            //   ),
                            //   child: Text('sns 가입'),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
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
                      child: Text(
                            '처리하는 개인정보 항목',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      )),
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
                        child: Text('- 닉네임, 비밀번호, PIN, 전화번호, 이메일주소, 성별, 생년월일, 프로필사진/n'
   '- (14세 미만 회원의 경우) 법정대리인의 성명, 생년월일, 전화번호, CI(암호화된 동일인 식별정보)/n'
   ' - 서비스 및 단말 정보: IP주소, 쿠키, MAC 주소, 서비스 이용 기록, 방문 기록, 불량 이용 기록, 단말 정보(제조사, 모델명, OS 종류 및 버전, 가입 통신사 등) 등/n',
                      ),
                    ),
                    ), ],
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
                  '기부어때 개인정보처리방침',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '업데이트 날짜: $_updateDate', // 업데이트된 날짜 표시
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              description(
                "(주)기부어때(이하 '회사'라 합니다)는 개인정보 보호법 제 30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개 합니다.",
              ),
              const SizedBox(height: 15),
              title('  제1조 (개인정보의 처리 목적, 보유 기간 및 처리하는 개인정보 항목)', size: 15),
              const SizedBox(height: 10),
              description(
                " ① 회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.",
              ),
              const SizedBox(height: 1),
              description(
                "② 회사는 법령에 따른 개인정보 보유·이용 기간 또는 정보주체로부터 개인정보의 수집 시에 동의받은 다음의 개인정보 보유·이용 기간 내에서 개인정보를 처리·보유합니다.",
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
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  // gridView() 함수 호출
                  gridView(),
                ],
              ),
              //const SizedBox(height: 10),
              //description(
               // "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
             //   tabIn: 2,
            //  ),
             // const SizedBox(height: 10),
             // description(
              //  "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무, 이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
              //  tabIn: 2,
             // ),
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
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      '3. 기부어때 회원 관리 및 서비스 운영',
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
                  //description(
                    //"(주)기부어때(이하 '회사'라 합니다)는 개인정보 보호법 제 30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개 합니다.",
                //  ),
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
