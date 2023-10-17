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
                " 주식회사 피치스소프트(이하 '회사'라 합니다) 은 이용자의 개인정보보호를 매우 중요시 하며, 『개인정보 보호법』,『정보통신망 이용촉진 및 정보보호 등에 관한 법률』등 개인정보와 관련된 법령 상의 개인정보보호 규정을 준수하고 있습니다. 회사는 아래와 같이 개인정보처리방침을 명시하여 이용자가 회사에 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치를 취하는지 알려드립니다. 회사의 개인정보처리방침은 법령 및 고시 등의 변경 또는 회사의 약관 및 내부 정책에 따라 변경될 수 있으며 이를 개정하는 경우 회사는 변경사항에 대하여 서비스 화면에 게시하거나 이용자에게 고지합니다. 이용자는 개인정보의 수집, 이용, 제공, 위탁 등과 관련한 아래 사항에 대하여 원하지 않는 경우 동의를 거부할 수 있습니다. 다만, 이용자가 동의를 거부하는 경우 서비스의 전부 또는 일부를 이용할 수 없음을 알려드립니다. 이용자께서는 어플리케이션과 홈페이지 방문시 수시로 확인하시기 바랍니다.",
              ),
              const SizedBox(height: 15),
              title(' 1. 개인정보의 수집 및 이용 목적', size: 15),
              const SizedBox(height: 10),
              description(
                "  개인정보는 생존하는 개인에 관한 정보로서 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함) 를 말합니다. 회사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.",
                  ),
              const SizedBox(height: 1),
              description(
                "1) 서비스 제공 및 서비스 제공에 따른 요금정산콘텐츠 제공, 구매 및 요금 결제 및 알림 서비스 제공, 서비스 오류 해결을 위한 기술적 목적",
                tabIn: 2,
              ),
              description(
                " 2) 회원 관리회원제 서비스 이용에 따른 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인",
              ),


              const SizedBox(height: 15),
              title(' 2. 수집하는 개인정보 항목 및 수집방법[수집하는 개인정보 항목]', size: 15),
              const SizedBox(height: 10),
              description(
                "  개인정보는 생존하는 개인에 관한 정보로서 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함) 를 말합니다. 회사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.",
              ),
              const SizedBox(height: 1),
              description(
                " 1) 회사는 이용자의 서비스 이용 시, 아래와 같은 이용자의 개인정보들이 수집될 수 있습니다.",
                tabIn: 2,
              ),
              description(
                " ○ 수집방법 : 앱, 전자우편, 서면, 전화 등\n"
                    " ○ 수집항목 : 닉네임, 성별, 나이, 프로필사진, 앱 이용 및 접속기록, 대금결제기록, 접속 일시기록, 로그인 IP 및 쿠키, 불량이용기록, 서비스 이용기록(정답 및 오답률 등) ",
              ),




              const SizedBox(height: 15),
              title(' 3. 수집하는 개인정보의 보유 및 이용기간원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.', size: 15),
              const SizedBox(height: 1),
              description(
                " 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간동안 보존합니다.",
              ),
              const SizedBox(height: 1),
              description(
                "1) 상거래 관련 보존 개인정보\n"
                " ①보존항목: 상거래이력\n"
                    " ②보존근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률 \n"
                    " ③보존기간: 계약 또는 청약철회 등에 관한 기록 : 5년\n"
                    " 대금결제 및 재화 등의 공급에 관한 기록 : 5년\n"
                    " 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년",

                tabIn: 2,
              ),

              description(
                "2) 로그기록 관련 보존 개인정보\n"
                "①보존항목: 접속기록\n"
                    "②보존근거: 통신비밀보호법\n"
                    "③보존기간: 3개월",
                tabIn: 2,
              ),



              const SizedBox(height: 1),
              description(
                "3) 전자금융거래기록 관련 보존 개인정보\n"
                    "①보존항목: 전자금융 거래에 관한 기록\n"
                    "②보존근거: 전자금융거래법\n"
                    "③보존기간: 5년",
                tabIn: 2,
              ),




                  const SizedBox(height: 15),
                  title('4. 개인정보의 파기절차 및 방법회사는 원칙적으로 개인정보 수집 및 이용목적이 달성되거나, 보유 및 이용기간이 경과된 후에는 해당 정보를 지체 없이 파기합니다.', size: 15),
                  const SizedBox(height: 1),
                  description(
                    "다만, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 1년 간 이용 기록이 없는 회원의 경우, 이용중인 회원의 개인정보와 별도 분리하여 안전하게 보관하며, 1년간 서비스를 이용하지 않은 경우 회원의 개인정보 일체를 파기합니다.개인정보의 파기 절차 및 방법은 다음과 같습니다.",
                  ),
                  const SizedBox(height: 1),
                  description(
                    "1) 파기절차이용자가 회원가입 등을 위해 입력하신 정보는 이용목적이 달성된 후 파기 됩니다. 다만, 법령에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기될 수 있습니다. 개인정보는 법률에 의한 경우가 아니고서는 보전되는 이외의 다른 목적으로 이용되지 않습니다."
                  ),
                  const SizedBox(height: 1),
                  description(
                    "2) 파기방법종이(인쇄물, 서면 등) 에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고, 전자적 파일형태로 저장된 개인정보는 복원이 불가능한 방법으로 영구 삭제합니다.",
                    tabIn: 2,
                  ),

              const SizedBox(height: 15),
              title('  5. 개인정보의 제공 및 공유원칙적으로 회사는 이용자의 개인정보를 수집 및 이용목적에 한해서만 이용하며 타인 또는 타기업·기관에 공개하지 않습니다.', size: 15),
              const SizedBox(height:0),
              description(
                " 다만, 아래의 경우에는 예외로 합니다.",
              ),

              description(
                "① 이용자가 사전에 동의한 경우\n"
                "② 서비스 제공에 따른 요금 정산을 위해 필요한 경우\n"
                "③ 전기통신기본법, 전기통신사업법 등 관계 법령의 규정에 의거하거나, 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우\n"
                "④ 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 가공하여 제공하는 경우",
                tabIn: 2,
              ),


              const SizedBox(height: 15),
              title('  6. 개인정보보호를 위한 기술적/관리적 대책', size: 15),
              const SizedBox(height: 10),

              description(
                " 1) 기술적인 대책\n"
                "① 회사는 이용자의 개인정보를 관련 법률규정 및 내부정책에 따라 보안기능을 통해 안전하게 보호하고 있습니다.\n"
                    "② 회사는 백신프로그램을 이용하여 컴퓨터 바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현될 경우 백신이 나오는 즉시 이를 적용함으로써 개인정보가 침해되는 것을 방지하고 있습니다.\n"
                    "③ 회사는 이용자의 비밀번호를 암호화하여 저장 및 관리하고 있으며, 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치를 채택하고 있습니다.\n"
                    "④ 회사는 해킹 등에 의해 이용자의 개인정보가 유출되는 것을 방지하기 위하여, 외부로부터의 침입을 차단하는 장치를 이용하고 있으며 24시간 X 365일 침입을 감시하고 있습니다.",
                tabIn: 2,
              ),
              description(
                " 2) 관리적인 대책\n"
                "① 회사는 이용자의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있으며, 그 최소한의 인원에 해당하는 자는 다음과 같습니다.\n"
             " - 이용자를 직접 상대로 하여 마케팅, 이벤트, 고객지원, 서비스운영 업무를 수행하는 자\n"
             " - 개인정보관리책임자 등 개인정보관리업무를 수행하는 자\n"
             " - 기타 업무상 개인정보의 취급이 불가피한 자\n"
             " ② 회사는 개인정보보호 업무를 전담하는 부서에서 개인정보처리방침 및 내부 규정 준수여부를 확인하여 문제가 발견될 경우, 즉시 바로 잡을 수 있도록 노력하고 있습니다.\n"
             " ③ 이용자 본인의 부주의나 인터넷상의 문제로 이름, 비밀번호 등의 개인정보가 유출되어 발생한 문제에 대해서는 회사가 일체 책임을 지지 않습니다.\n"
              ),

              description(
                " ③ 전기통신기본법, 전기통신사업법 등 관계 법령의 규정에 의거하거나, 수사목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우",
              ),
              description(
                "④ 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 가공하여 제공하는 경우",
              ),

              const SizedBox(height: 15),
              title('7. 이용자 권리와 그 행사방법',

               size: 15),
              const SizedBox(height: 10),
description(
              "이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 이용자의 개인정보 조회·수정을 위해서는 '회원정보'의 '내 정보'를 통하여 가능하며, 가입해지 시에는 '문의하기'를 클릭하여 탈퇴의사 전달을 거치신 후 탈퇴가 가능합니다. 혹은 앱내 탈퇴하기로 진행 및 앱 내 문의하기로 연락하시면 지체 없이 조치하겠습니다. 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다. 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 '회사가 수집하는 개인정보의 보유 및 이용기간'에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다."),




              const SizedBox(height: 15),
              title('8. 개인정보 보호책임자 및 상담·신고',

                  size: 15),
              description(
                " 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 회사는 개인정보 보호책임자를 두고 있습니다. 이용자의 개인정보와 관련한 문의사항이 있으시면 아래의 개인정보 보호책임자 또는 개인정보 보호관리자에게 연락 주시기 바랍니다.",

                tabIn: 2,
              ),



              const SizedBox(height: 10),
                  description(
                    "개인정보 보호책임자 : 정인용\n"
                    "이메일 : help.peachesoft@gmail.com\n"
                 " 개인정보침해에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 사이버범죄수사과, 경찰청 사이버안전국 등으로 문의하실 수 있습니다.\n"
                  "[개인정보침해신고센터]118ㅣURL : privacy.kisa.or.kr/[대검찰청 사이버범죄수사과]1301ㅣURL : www.spo.go.kr[경찰청 사이버안전국]182ㅣURL : cyberbureau.police.go.kr..\n",
                    tabIn: 2,
                  ),


              const SizedBox(height: 10),
              title('부칙', size: 15),
              const SizedBox(height:0),
              description(
                " 1) 회사는 본 개인정보처리방침을 변경하는 경우 그 변경 사유 및 적용일자를 명시하여 현행 개인정보처리방침과 함께 적용일자 10일전부터 적용일전까지 서비스 화면에 고지합니다.\n"
               " 다만, 이용자의 권리 또는 의무에 중요한 내용의 변경이 있을 경우에는 최소 30일전에 고지합니다.\n"
                 " 2) 회사가 제1항에 따라 변경 내용을 고지하면서 변경 적용일까지 거부의사를 표시하지 않으면 의사표시가 된 것으로 본다는 뜻을 고지하였음에도 불구하고 이용자가 명시적으로 거부의사를 표시하지 아니하는 경우 이용자가 변경 내용에 동의한 것으로 봅니다.\n"
           " 3) 회사는 제 2항에도 불구하고 이용자로부터 개인정보를 추가 수집하거나 제3자에게 제공하는 경우에는 이용자 본인으로부터 이에 대하여 별도 동의 절차를 거칩니다.\n"

      ),
              description(
                "본 개인정보 처리방침은 2023년 04월 01일부터 적용됩니다.\n"
                "개인정보처리방침 변경공고일자 : 2023년 04월 01일\n"
              "개인정보처리방침 시행일자 : 2023년 04월 01일\n",
                tabIn: 2,
              ),


            ],


          ),
        ),

      ),
    );
  }
}
