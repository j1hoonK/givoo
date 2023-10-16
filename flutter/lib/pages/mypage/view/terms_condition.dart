import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';



void main() { runApp(TermsCondition());}
class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}



class _TermsConditionState extends State<TermsCondition> {
  int _selectedItemIndex = -1;
  String _updateDate = '';
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
      padding: EdgeInsets.all(15.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget gridView() {
    return Container(); // 여기에 그리드뷰의 내용을 추가할 수 있습니다.
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
                  '기부어때 이용약관',
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
              const SizedBox(height: 15),



              title('  제1장 총 칙', size: 17),
              const SizedBox(height: 10),
              title('  제1조 목 적', size: 15),
              description(
                " 이 약관은 주식회사 피치스소프트(이하 '회사'라 합니다)이 제공하는 서비스(이용고객 또는 회원이 PC, 멀티미디어 모바일 등의 각종 디지털기기 또는 프로그램을 통하여 이용할 수 있도록 회사가 제공하는 모든 서비스를 의미합니다.)와 관련하여, 회사와 이용고객(또는 회원)간에 서비스 이용조건 및 절차, 회사와 회원간의 권리ㆍ의무 및 책임사항 기타 필요한 사항을 규정함을 목적으로 합니다.",
              ),

              const SizedBox(height: 10),
              title(' 제2조 효력의 발생 및 변경', size: 15),
              const SizedBox(height: 10),
              description(
                "① 본 약관은 온라인 상에 게시함으로써 효력이 발생하게 됩니다.\n"
                "② 회사는 영업상의 중요사유 또는 관계법령이 규정한 변경사유가 발생한 경우에, 전항과 같은 방법으로 본 약관을 변경할 수 있습니다.이와 같은 경우, 본 서비스의 이용조건은 변경 후의 내용을 따르게 됩니다.",
                tabIn: 2,
              ),


              const SizedBox(height: 10),

              title('제3조 회사의 통지', size: 15),
              description(
                "① 회사는 온라인 상에 표시하거나 기타 회사가 타당하다고 판단한 방법으로 회원에 대하여 수시로 필요한 사항을 통지합니다.\n"
                "② 전항의 통지는 회사가 해당 통지내용을 온라인 상에 표시한 시점 또는 통지내용이 회원에게 도착한 시점 중 먼저 이루어진 방법이 효력을 갖습니다.",
                tabIn: 2,
              ),

              const SizedBox(height: 10),

              title('제2장 회원가입과 서비스이용', size: 17),
              const SizedBox(height: 10),

              title('제4조 회원계약의 성립', size: 15),
              description(
                "① 본 서비스 이용은 해당 어플을 설치하여 실행하고 프로필을 작성함으로 회원가입요청을 신청한 것으로 간주합니다.\n"
               " ② 회원계약을 신청하신 분 (이하, '신청자'라 한다) 은 회원계약을 신청한 시점에서 본 약관의 내용을 수락했다고 간주합니다.\n"
          "③ 회사는 회원계약 신청에 대하여, 필요한 절차 등을 거친 뒤, 이를 승낙할 수 있습니다. 다만, 회사는 신청자가 회원으로 적합하지 않다고 판단한 경우, 해당 회원계약 신청을 승낙하지 않을 수도 있습니다.\n"
        "④ 회사가 전항을 승낙한 시점에서 회원계약이 성립됩니다.제5조 서비스 이용\n"
       " ⑤ 본 서비스는 회사의 업무상 또는 기술상 특별한 지장이 없는 한, 원칙적으로 하루 24시간 운영합니다.\n"
       " ⑥ 본 서비스는 개인이용에 한정하여 이용합니다.\n"
       " ⑦ 본 서비스는 만17세 이상인 분에 한하여 이용할 수 있습니다.\n"
        "⑧ 본 약관을 위반하여 어플리케이션을 이용하는 것을 금지합니다.",
                tabIn: 2,
              ),
              title('제3장 의무 및 권리', size: 17),
              const SizedBox(height: 10),
              title('제5조 회사의 의무', size: 15),
              const SizedBox(height: 10),
              description(
                " ① 회사는 특별한 사정이 없는 한 회원에 대하여 회원계정을 발행하며, 닉네임 등 프로필설정을 허가합니다.\n"
               " ② 회사는 본 약관의 규정에 따라 계속적, 안정적으로 서비스를 제공합니다.",
                tabIn: 2,
              ),


              title('제6조 회원의 의무', size: 15),
              const SizedBox(height: 10),
              description(
              "① 회사는 회원 계정, 사용자명 및 가입정보를 제3자 (가족 등도 포함한 사람을 지칭합니다) 가 이용 또는 변경함으로써 해당 회원이 입은 손해에 대하여 해당 회원의 고의, 과실 유무에 상관없이 어떠한 책임도 지지 않습니다.\n"
       " ② 회원은 회사에 등록한 내용 중 변경된 사항이 있는 경우, 즉시 회사에 소정 변경 신고를 해야 합니다.",

          tabIn: 2,
              ),

              title('제7조 금지사항', size: 15),
              const SizedBox(height: 0),

              description(
             "① 회원은 본 서비스를 이용하여 아래에 열거한 행위를 하는 것을 금합니다.\n"
             " 1. 공공질서 및 사회적 통념에 반하는 행위\n"
             " 2. 사회적 공익을 저해할 목적을 갖고 서비스이용을 계획 또는 실행하는 행위\n"
             " 3. 법률, 조례, 기타 법규를 위반하는 행위\n"
              "4. 협박, 중상, 외설, 추문, 선동적인 소재를 게재하는 행위\n"
              "5. 다른 회원 또는 제3자의 명예를 훼손하거나 불이익을 주는 행위\n"
              "6. 광고 또는 컴퓨터바이러스를 발송하는 행위\n"
              "7. 복수등록\n"
              "8. 계정, 타인의 정보를 도용하는 행위\n"
              "9. 회원 계정을 매매 또는 대여하는 행위\n"
              "10. 포인트를 매매하는 행위\n"
              "11. 저작권 보호자료를 게재하는 행위\n"
              "12. 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제44조 7항에 위배되는 내용을 게재하는 행위\n"
              "13. 위에 열거한 내용 이외의 회사가 적절하지 않다고 판단하는 행위\n",

              tabIn: 2,
              ),


              title('제8조 회원의 권리 및 책임', size: 15),
              const SizedBox(height: 0),

              description(
              "① 회원은 언제든지 본 약관에 대한 동의를 철회하고, 제11조에 규정된 절차에 따라 회원계약을 해지할 수 있습니다.\n"
              "② 회원은 언제든지 자신의 개인정보에 대한 열람을 요구할 수 있으며, 자신의 개인정보에 오류가 있는 경우, 이를 정정하도록 요구할 수 있습니다.",
                tabIn: 2,
              ),

              title('제4장 서비스의 이용제한, 해지 및 종료', size: 17),
              const SizedBox(height: 10),
              title('제9조 이용제한', size: 15),
              description(
             "① 회사는 회원이 아래의 각 호에 해당사항이 있는 경우 또는 회사가 해당사항이 발생할 가능성이 있다고 판단한 경우, 해당 회원의 승낙없이 해당 회원이 본 서비스를 이용하는 것을 제한할 수 있습니다.\n"
              " 1. 회사가 요청한 개인정보에 허위가 있다고 판명된 경우\n"
              " 2. 개인정보에 기재된 연락방법을 이용해도 연락을 취할 수 없는 경우\n"
              " 3. 이용상황, 회사가 입수한 정보 등을 고려하여 해당 회원의 회원계정, 사용자명, 등이 제3자에게 무단 사용되었다고 추측되는 경우\n"
              " 4. '제8조' 에 기재된 행위를 하는 경우\n"
              " 5. 기타 관련법령과 본 약관을 위반한다고 사료되는 행위를 한 경우\n"
              " 6. 위의 각 호 이외에 회사가 해당 회원의 이용을 시급히 제한할 필요가 있다고 판단한 경우\n"
              "② 회사가 전항에 기재된 조치를 취함으로써 해당 회원이 본 서비스를 이용하지 못하여 이로 인해 손해가 발생하더라고 회사는 책임을 않습니다.\n",
                tabIn: 2,
              ),

              title('제10조 해지', size: 15),
              const SizedBox(height: 0),

              description(
                "회원이 회원계약을 해지할 때는 회원본인이 회사가 규정한 탈퇴절차를 통하여 해지신청을 해야 합니다. 회사는 법령 등의 규정에 따라 이를 처리합니다.",
                tabIn: 2,
              ),
              title('제11조 해지', size: 15),
              const SizedBox(height: 0),

              description(
               "회사는 제4조에서 규정한 신청시 입력한 내용에 하자가 있는 경우, 제7조에 규정한 회원의 의무를 이행하지 않은 경우, 또는 제8조에 규정한 금지사항을 위반한 경우, 본 약관 등 기타 내용을 위반한 경우에는 예고 없이 해당 회원의 게시물 삭제와 회원 계약을 해지할 수 있습니다.",
                tabIn: 2,
              ),
              title('제12조 회원자격의 상실', size: 15),
              const SizedBox(height: 0),

              description(
              "① 제11조 또는 제12조의 규정에 따라 회원계약이 해지된 경우에는 해당 회원은 회원자격을 상실합니다.\n"
              "② 해당 회원의 연락처는 회원자격을 상실한 날로부터 회사의 회원목록에서 삭제됩니다. 또한, 회사의 데이터베이스에 보존한 회원데이터는 일정기간이 경과하면 삭제됩니다.",
                tabIn: 2,
              ),
              title('제13조 서비스의 일시적 중단', size: 15),
              const SizedBox(height: 0),

              description(
             "① 회사는 아래의 열거한 사유에 해당사항이 있는 경우, 회원에게 사전 연락없이 일시적으로 본 서비스를 중단할 경우가 있습니다. 이 경우, 회사는 회원 또는 제3자가 본 서비스의 중단으로 인해 입게 된 손해에 대하여 어떠한 책임도 지지 않습니다.\n"
             " 1.본 서비스 시스템을 정기적 또는 긴급 보수, 점검, 수리, 변경하는 경우- 화재, 정전 등으로 본 서비스를 제공하지 못하게 된 경우\n"
              " 2. 지진, 분화, 홍수, 지진, 해일 등 천재지변으로 본 서비스를 제공할 수 없게 된 경우- 전쟁, 변란, 폭동, 소란, 노동쟁의 등으로 본 서비스를 제공할 수 없게 된 경우\n"
             " 3. 기타 운용적 또는 기술적으로 회사가 본 서비스를 일시적으로 중단할 필요가 있다고 판단한 경우\n"
             "② 전항에 열거한 내용 외의 사유로 본 서비스 제공을 연기 또는 중단한 경우에도, 회사는 회원 또는 제3자가 해당사유로 인해 입게 된 손해에 대하여 어떠한 책임도 지지 않습니다.\n",
              ),
              title('제14조 본 서비스의 제공 종료', size: 15),
              const SizedBox(height: 0),

              description(
              "① 회사는 예고없이 본 서비스의 전부 또는 일부의 제공을 종료할 수 있습니다.\n"
              "② 회사는 본 서비스 제공을 종료할 경우, 종료에 따른 책임을 지지 않습니다.• 제7조 제6항 및 제20조 내지 제24조의 규정은, 본 서비스의 종료후에도 효력을 계속적으로 유지합니다. 본 서비스 종료 후에도 내용의 성질상 존속이 예상되는 기타 규정도 이와 같습니다.\n",
                tabIn: 2,
              ),

              title('제5장 개인정보의 관리', size: 17),
              const SizedBox(height: 10),
              title('제15조 개인정보의 수집 및 취급', size: 15),
              description(
             " 회사는 관련법령의 규정에 따라 회원의 개인정보 보호를 위해 최선을 다합니다. 회원의 개인정보 보호와 이용에 관해서는 관련법령 및 회사의 개인정보 보호방침이 적용됩니다. 단, 회사의 공식 어플리케이션 이외의 링크된 컨텐츠에 대해서는 회사의 개인정보 보호방침이 적용되지 않습니다. 또한, 회사는 이용자의 귀책사유로 인하여 공개된 정보에 대해서는 일체 책임을 지지 않습니다.\n"
             "① 수집한 개인정보는 회사의 최소인원이 취급하도록 하며, 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전을 확보합니다.\n"
             "② 수집한 개인정보는 원칙적으로 컨텐츠 제공에만 사용하며 제3자에게 제공하지 않습니다. 회사는 아래와 같은 경우, 법률이 허락하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.\n"
              " 1. 회원의 서비스이용에 있어 관계법률을 위반하여 조사기관 및 기타 정부기관으로부터 정보제공 요청을 받은 경우\n"
                 " 2. 회원의 법률위반, 본 서비스 약관 위반을 포함한 부정행위 확인 등 정보보호업무를 위해 필요한 경우\n",
                tabIn: 2,
              ),

              title('제16조 광고의 제공', size: 15),
              const SizedBox(height: 0),

              description(
              "① 회사는 서비스의 운영과 관련하여 서비스 내에 광고를 게재 할 수 있습니다. 또한 수신에 동의한 회원에 한하여 푸시 메시지(Push Notification) 등의 방법으로 광고성 정보를 전송할 수 있습니다. 이 경우 회원은 언제든지 수신을 거절할 수 있으며, 회사는 회원의 수신 거절 시 광고성 정보를 발송하지 아니합니다.\n"
       "② 회사가 제공하는 서비스 중의 배너 또는 링크 등을 통해 타인이 제공하는 광고나 서비스에 연결 될 수 있습니다.\n"
       "③ 제2항에 따라 타인이 제공하는 광고나 서비스에 연결될 경우 해당 영역에서 제공하는 서비스는 회사의 서비스 영역이 아니므로 회사가 신뢰성, 안전성 등의 보장하지 않으며, 그로 인한 회원의 손해에 대하여도 회사는 책임을 지지 않습니다.다만, 회사가 고의 또는 중과실로 손해의 발생을 용이하게 하거나 손해 방지를 위한 조치를 취하지 아니한 경우에는 그러하지 아니합니다.\n",

        tabIn: 2,
              ),


              title('제6장 유료서비스 안내', size: 17),
              const SizedBox(height: 10),
              title('제17조 유료서비스의 내용 등의 게시', size: 15),
              description(
              "①회사는 다음 사항을 해당 유료서비스의 이용초기화면 등에 이용자가 알기 쉽게 표시합니다.\n"
              "1. 유료서비스의 명칭, 종류 및 내용\n"
              "2. 유료서비스의 가격과 그 지급방법 및 시기\n"
              "3. 유료서비스의 공급방법, 시기 및 제공기간\n"
              "4. 청약의 철회 및 계약의 해제의 기한·행사방법 및 효과에 관한 사항\n"
              "5. 서비스계약이 계속 거래에 해당할 경우, 계약의 해지와 그 행사방법 및 효과에 관한 사항\n"
              "6. 서비스의 교환·반품·보증과 그 대금 환급의 조건 및 절차\n"
              "7. 전자매체로 공급이 가능한 서비스의 전송·설치 등과 관련하여 요구되는 기술적 사항\n"
              "8. 이용자피해보상, 서비스에 대한 불만 및 이용자와 회사간 분쟁처리에 관한 사항\n"
              "9. 거래에 관한 약관\n"
              "10. 서비스의 가격 외에 이용자가 추가로 부담하여야 할 사항이 있는 경우, 그 내용 및 금액\n"
              "11. 이용자가 미성년자인 경우, 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용\n"
              "② 회사에서 제공하는 유료서비스는 이용자가 구매하는 즉시 이용자 아이디로 지급되며, 유료서비스 제공기간에 따라 사용할 수 있습니다.\n",
              ),

              title('제18조 이용 계약의 성립', size: 15),
              const SizedBox(height: 0),

              description(
              "회원이 회사에 대하여 유료서비스 이용 신청을 하고, 회사가 이에 대해 승낙함으로써 회원과 회사간의 유료서비스 이용계약이 성립됩니다.",
                tabIn: 2,
              ),

              //20조 부터
              title('제19조 포인트의 충전', size: 15),
              const SizedBox(height: 0),

              description(
                "① 포인트의 충전은 회사의 올캠 계정(구글계정)이 있어야 가능합니다.\n"
               "② 포인트의 충전은 휴대폰, KT폰빌, 신용카드, 문화상품권, 도서상품권등 회사에서 제공하는 결제방식을 통해서 가능합니다. 다만, 각 결제수단을 운영하는 사업자가 별도로 있는 경우, 이용자는 해당 결제수단을 이용하기 전에 해당 결제수단의 사업자가 제시하는 절차를 이행하여야 합니다. 회사의 서비스 이용요금을 결제할 때에는 해당 결제수단의 사업자가 제시하는 절차 이행 및 이용약관에 동의한 것으로 간주합니다.",

                tabIn: 2,
              ),

              title('제20조 결제에 대한 승인', size: 15),
              const SizedBox(height: 0),

              description(
                " ① 회사는 다음의 각 항에 해당하는 이용신청에 대해서는 승인을 하지 않거나, 추후 해당 승인을 취소할 수 있습니다.\n"
                 "  1. 이용 요금을 납부하지 않거나 납부자를 확인할 수 없는 경우\n"
              "  2. 만 19세 미만의 미성년자가 법정대리인의 동의 없이 신청한 경우\n"
              "  3. 이용신청자의 귀책사유로 승인이 불가능하다고 판단되는 경우\n"
             "  4. 기타 이용 신청을 승인하는 것이 관계 법령이 위반되거나 사회 안녕 질서 및 미풍양속, 회사의 관련 약관 등 회사의 업무 방침에 위반된다고 판단되는 경우\n"
             " ② 회사는 다음의 각 항에 해당하는 경우에는 이용신청에 대한 승인 제한 사유가 해소될 때까지 승인을 제한할 수 있습니다.\n"
             "  1. 서비스 설비가 부족하여 만족스러운 서비스를 제공할 수 없다고 판단될 경우\n"
             "  2. 서비스 상의 장애가 발생한 경우\n",
                tabIn: 2,
              ),

              title('제21조 사용기간 등', size: 15),
              const SizedBox(height: 0),

              description(
                "충전한 포인트 사용기간은 마지막 이용일로부터 5년 이내에 사용해야 하고, 기간 내 사용되지 않은 포인트는 상사시효에 근거하여 회사의 최종 서비스 이용일로부터 5년이 경과한 후에는 자동으로 소멸됩니다. 다만, 다른 법령에서 이보다 단기의 시효의 규정이 있는 때에는 그 규정에 의합니다.",
                tabIn: 2,
              ),

              title('제22조 요금 등의 납입방법', size: 15),
              const SizedBox(height: 0),

              description(
                "① 유료서비스 요금 등은 선납을 원칙으로 하며, 일정 금액을 회사가 제공하는 결제 수단을 통하여 이용자가 선입금한 후 구매, 사용에 따라 차감하는 형식으로 요금을 청구, 납입 합니다.\n"
                "② 유료서비스 요금 등의 종류는 본 약관과 각 해당서비스에서 정한 바에 따릅니다.\n"
               "③ 장애로 인해 구매한 서비스를 이용하지 못할 경우, 이용약관의 손해배상 조항에 따릅니다.\n",
                tabIn: 2,
              ),

              title('제23조 미성년자의 결제', size: 15),
              const SizedBox(height: 0),

              description(
                "① 이용자가 미성년자(만 19세 미만) 또는 한정치산자인 경우는, 유료 서비스 이용을 위해 결제하기 전에, 민법 제5조 1항에 따라 법정대리인(부모 등)의 동의를 받아야 합니다. 회사가 정한 절차에 따른 법정대리인의 동의를 받지 않은 경우는 유료 서비스를 이용할 수 없습니다. 미성년자가 다른 성년자 등의 주민등록번호를 이용하여 회원가입을 하거나 성년자 등의 결제정보를 동의 없이 이용하는 등 사술로써 회사로 하여금 성년자인 것으로 믿게 한 경우에는 법정대리인의 동의가 없더라도 유료 서비스 이용계약을 취소하지 못합니다.\n"
                "② 전항의 미성년자 결제에 대한 동의를 위해 법정대리인은 회사의 안내에 따라 휴대폰 인증, 아이핀 인증, 팩스 인증의 방법을 사용할 수 있으며, 법정대리인의 동의가 완료된 이후 회사는 법정대리인에게 이메일을 통해 결제 동의사실 및 그 내역에 대해 고지합니다. 법정대리인은 이러한 통지를 거부할 수 있으며, 아래의 고객센터를 통해 상세내역에 대하여 문의하실 수도 있습니다.\n"
             " - 고객센터 (어플리케이션 내에 있는 고객센터 문의)\n"
             " ③ 동의서 유효기간에 대해 미성년자의 법정대리인은 회사의 안내에 따라 3개월, 6개월, 9개월, 1년, 3년, 5년의 유효기간 중 선택할 수 있습니다. 회사는 법정대리인이 선택한 동의유효기간 만료시점으로부터 30일 전에 법정대리인에게 이메일을 통해 통지하여 동의연장여부를 확인하며, 이에 대해 법정대리인의 동의철회 요구 등이 없을 경우 동의유효기간은 동일한 조건으로 자동 연장됩니다.\n",
                tabIn: 2,
              ),
              title('제24조 요금 등의 이의신청', size: 15),
              const SizedBox(height: 0),

              description(
                "① 이용자는 선납한 요금 등에 이의가 있을 경우에는 유료서비스 사용일로부터 1개월 이내에 이의신청을 할 수 있습니다.\n"
                "② '회사'는 전항의 이의신청 접수 후 10일 이내에 타당성 여부를 조사하고, 그 결과를 이용자에게 통지합니다.\n"
              "③ 부득이한 사유로 전항의 기간 내에 이의신청결과를 통지할 수 없을 경우에는 그 사유와 재지정된 처리기한을 명시하여 이를 이용자에게 통지합니다.\n",
                tabIn: 2,
              ),

              //26조
              title('제 25조 이용계약 해지 절차', size: 15),
              const SizedBox(height: 0),

              description(
                "① 이용자가 이용계약을 해지하고자 하는 때에는 본인이 직접 회사의 '서비스' 어플리케이션을 통하여 회사에 신청하여야 합니다.\n"
                  "② '회사'는 전항의 규정에 의하여 해지신청이 접수되면 지체 없이 서비스의 이용을 제한합니다.\n"
                  "③ '회사'는 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용자에게 통지하여 의견을 진술할 기회를 주어야 합니다. 다만, 다음 각호의 1에 해당하는 경우에는 즉시 해지를 할 수 있습니다.\n"
             " 1. 이용자가 이용제한 규정을 위반하거나, 그 이용제한 기간 내에 제한 사유를 해소하지 않은 경우\n"
             " 2. 타인명의 이용신청 또는 허위의 이용신청, 허위서류를 첨부한 이용신청임이 확인된 경우\n"
             " 3. 미성년자 또는 한정치산자가 법정대리인(부모 등)의 동의서를 첨부하지 않고 이용신청을 한 경우 이용자가 정당한 사유 없이 의견진술에 응하지 않는 경우\n"
             "④ '회사'는 전항 단서의 규정에 의하여 해지된 이용신청고객의 이용신청에 대하여 해지 후 1개월 이내에는 불승낙을 할 수 있습니다.\n"
       "⑤ '회사'는 계약이 해지된 이용자가 '서비스'에 제공하거나, 보관중인 자료 및 제공한 개인정보를 삭제하고, 이와 관련하여 어떠한 책임도 부담하지 않습니다.\n",
                tabIn: 2,
              ),
              title('제26조 유료서비스에 대한 청약철회 및 계약해제', size: 15),
              const SizedBox(height: 0),

              description(
                "① 이용자가 구매하는 포인트는 관련법령에 따라 청약의 철회 또는 계약의 해제(이하 '청약철회 등'이라 합니다)가 가능한 것과 청약철회 등이 제한되는 것으로 구분되며, 청약철회 등이 제한되는 경우에는 이용자가 포인트를 구매할 시 고지됩니다.\n"
        "② 이용자는 청약철회 등이 가능한 서비스에 대해서 구매일로부터 7일 이내에 청약철회 등을 하여야 합니다. 다만, 계약내용에 관한 서면을 교부 받지 아니한 경우, 회사의 주소 등이 기재되지 아니한 서면을 교부 받은 경우 또는 회사의 주소 변경 등의 사유로 7일 이내에 청약철회 등을 할 수 없는 경우에는 그 주소를 안 날 또는 알 수 있었던 날로부터 7일 이내에 당해 계약에 관한 청약철회 등을 할 수 있습니다.\n"
        "③ 이용자는 서비스의 내용이 표시·광고 내용과 다르거나 계약 내용과 다르게 이행된 경우에는 당해 서비스를 공급받은 날로부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회 등을 할 수 있습니다.\n"
       "④ 이용자는 구두 또는 서면(전자문서를 포함)으로 청약철회 등을 할 수 있으며, 이용자는 청약철회 등을 서면으로 하는 경우, 그 의사표시가 기재된 서면을 발송한 날에 그 효력이 발생합니다.\n"
     "⑤ 회사는 이용자가 원활하게 청약철회 등을 할 수 있도록 계약 체결 시 사용한 방법에 추가하여 아래와 같은 방법을 제공합니다.\n"
     " - 고객센터 (어플리케이션 내에 있는 고객센터 문의)\n"
     "⑥ 서비스의 훼손에 대하여 이용자의 책임이 있는지의 여부, 서비스의 구매에 관한 계약이 체결된 사실 및 그 시기, 서비스의 공급사실 및 그 시기 등에 관하여 다툼이 있는 경우에는 회사가 이를 입증하여야 합니다.\n"
   "⑦ 청약철회 등을 한 경우 이용자는 공급받은 서비스를 반환하여야 하는바, 서비스의 반환에 필요한 비용은 제27조 제2항에 의한 청약철회 등의 경우에는 이용자가 부담하며, 제27조 제3항에 의한 청약철회 등의 경우 회사가 부담합니다.\n"
    "⑧회사는 서비스를 반환 받은 날부터(별도의 서비스 반환 등이 필요하지 않은 경우에는 청약철회 등의 의사표시를 수령한 날로부터) 3영업일 이내에 대금의 결제와 동일한 방법으로 이를 환급하며, 동일한 방법으로 환불이 불가능할 때에는 이를 사전에 고지합니다.\n"
    "⑨ 회사는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구할 수 없으며, 회사는 반환된 서비스가 일부 사용 또는 일부 소비된 경우 그 서비스의 사용 또는 일부 소비에 의하여 이용자가 얻은 이익 또는 그 서비스의 공급에 소요된 비용에 상당하는 금액의 범위 내에서 이용자에게 청구할 수 있습니다.\n"
    "⑩ 기타 본 약관에서 정하지 않은 부분은 전자상거래등에서의 소비자 보호에 관한 법률 등 관련 법령에서 정하는 바에 의합니다.\n",
                tabIn: 2,
              ),

              title('제27조 이용자의 계약 해지·해제', size: 15),
              const SizedBox(height: 0),

              description(
                "① 이용자는 다음 각호의 어느 하나에 해당하는 경우 하트 및 유료서비스 관련 계약을 해제 또는 해지할 수 있습니다.1. 이용자가 회사와 합의한 해제·해지사유가 발생한 경우2. 법률에서 정한 해제·해지사유가 발생한 경우\n"
                "② 회사가 포인트를 공급하지 않거나 불완전한 서비스를 공급한 경우에 있어서 이용자가 당해 서비스계약을 해제 또는 해지하기 위하여는 상당한 기간을 정하여 완전한 서비스를 공급할 것을 최고하여야 합니다. 다만, 이용자는 다음 각호의 어느 하나에 해당하는 경우 최고를 하지 않고 계약을 해제 또는 해지할 수 있다.\n"
              "1. 일정한 시일 또는 기간 내에 서비스를 공급하여야만 그 목적을 달성할 수 있는 계약에서 회사가 그 시기에 서비스를 공급하지 아니한 경우\n"
              "2. 회사가 미리 서비스를 공급하지 않을 의사를 표시한 경우\n"
              "3. 완전한 서비스의 공급이 불가능한 경우(서비스 구입목적을 달성할 수 없는 경우에 한함)\n"
          "4. 서비스계약이 계속거래에 해당하는 경우기타 법률에 규정되거나 당사자가 합의한 경우\n"
        "5. 기타 법률에 규정되거나 당사자가 합의한 경우\n",
                tabIn: 2,
              ),

              title('제28조 회사의 계약 해지·해제', size: 15),
              const SizedBox(height: 0),

              description(
                "① 회사는 다음 각호의 어느 하나에 해당하는 경우 당해 서비스계약을 해제 또는 해지할 수 있다.\n"
                 " 1. 이용자와 합의한 해제·해지사유가 발생한 경우\n"
              " 2. 법률에서 정한 해제·해지사유가 발생한 경우\n"
            "② 회사는 이용자가 채무를 이행하지 않은 경우(서비스대금을 지급하지 않은 경우 등)에 당해 서비스계약을 해제 또는 해지하기 위해서 상당한 기간을 정하여 채무의 이행을 최고하여야 한다. 다만, 회사는 다음 각호의 어느 하나에 해당하는 경우 최고없이 계약을 해제 또는 해지할 수 있다.\n"
       " 1. 이용자가 채무이행을 거절한 경우\n"
       " 2. 기타 법률에서 규정하고 있는 경우\n",
                tabIn: 2,
              ),

              title('제29조 계약 해제·해제의 효과', size: 15),
              const SizedBox(height: 0),

              description(
                "① 회사 또는 이용자가 서비스계약을 해제한 경우, 이용자는 회사에게 서비스를 반환하여야 합니다. 다만, 이용자가 서비스를 이용한 경우 그 사용에 따라 얻은 이익을 반환하여야 합니다. 회사는 대금을 받은 날로부터 그 대금에 이자를 더하여 이용자에게 반환하여야 하며, 회사 또는 이용자는 해제권의 행사와 별도로 상대방에게 손해배상을 청구할 수 있습니다. 다만, 상대방이 손해배상책임을 면하기 위해서는 자신에게 고의 또는 과실 없음을 증명하여야 합니다.회사 또는 이용자가 서비스계약을 해지한 경우에 당해 서비스계약은 해지한 시점 이후부터 효력을 잃으며, 회사 또는 이용자는 해지권의 행사와 별도로 상대방에게 손해배상을 청구할 수 있습니다. 다만, 상대방이 손해배상책임을 면하기 위해서는 자신에게 고의 또는 과실 없음을 증명하여야 합니다. 이용자가 계속 거래에 해당하는 서비스계약을 해지한 경우, 회사가 이용자에게 청구할 수 있는 손해배상액(위약금)은 다음 각호에 의하여 산정됩니다.\n"
                 " 1. 회사는 이용자의 해지로 인해 발생하는 손실을 현저에게 초과하는 위약금을 청구하거나 가입비 그 밖의 명칭여하를 불문하고 실제 공급된 서비스의 대가를 초과하여 수령한 대금의 반환을 부당하게 거부하여서는 아니됩니다.\n"
             " 2. 서비스계약이 해지된 경우 이용자는 반환할 수 있는 서비스를 회사에게 반환할 수 있으며, 회사는 반환 받은 서비스의 가치에 상당하는 금액을 계약의 해지에 따라 지급하여야 할 환급금에 더하거나 청구할 수 있는 위약금에서 감액하여야 합니다.\n"
             " 3. 회사는 서비스계약이 해지된 때에 이용자로부터 받은 서비스의 대금(서비스가 반환된 경우 환급하여야 할 금액을 포함)이 이미 공급한 서비스의 대금에 위약금을 더한 금액보다 많은 경우에는 그 차액을 이용자에게 환급하여야 합니다.\n"
         " 4. 회사는 차액의 환급을 지연한 경우에 지연기간에 대한 지연배상금을 더하여 환급하여야 합니다\n"
      " 5. 계약의 해지 또는 대금의 환급에 관하여 이용자의 책임이 있는지의 여부, 계약이 체결된 사실 및 그 시기, 서비스의 공급 사실 및 그 시기에 관하여 다툼이 있는 경우에는 회사가 이를 입증하여야 합니다.\n",
                tabIn: 2,
              ),

              title('제30조 양도금지', size: 15),
              const SizedBox(height: 0),

              description(
                "이용자의 약관 상의 권리는 이를 양도하거나 증여할 수 없으며, 질권의 목적으로 사용할 수 없습니다.",
                tabIn: 2,
              ),

              title('제31조 환불', size: 15),
              const SizedBox(height: 0),

              description(
                "① 회원이 자신의 ID를 통해 결제한 포인트의 잔여액에 대한 환불을 요청하면 특수한 상황이 아닌이상 부분환불은 불가합니다.\n"
                "② 상품권(유가증권) 환불의 경우 부정결제 및 현금교환(상품권깡)을 방지하고자 환불수수료 10% 적용합니다.\n"
      "③ 환불 받으려고 하는 ID가 회사의 서비스에서 탈퇴한 경우에는 환불이 불가능합니다.\n"
      "④ 유료 서비스의 경우 이미 사용한 부분에 대한 환불은 불가능합니다.\n"
      "⑤ 회사가 운영하는 서비스를 회원이 중도 해지하는 경우, 이미 사용한 포인트 및 충전한 포인트의 환불은 불가합니다. 다만, 회사가 유료서비스 제공 의무를 이행하지 않은 경우, 서비스 장애로 인하여 회원이 유료서비스를 정상적으로 이용하지 못한 경우 등 회원의 귀책사유가 없는 경우에는 환불수수료를 면제합니다.\n"
      "⑥ 회사가 무료로 지급하거나 타인으로부터 선물 받은 유료서비스는 환불이 불가능합니다.\n",
                tabIn: 2,
              ),

              //33조
              title('제7장 손해배상 등', size: 17),
              title('제32조 면책사항', size: 15),
              const SizedBox(height: 0),

              description(
                "① 컨텐츠 이용을 포함한 본 서비스 이용은 회원본인의 책임하에 이루어집니다. 본 서비스 및 모든 컨텐츠는 현상 유지된 상태 및 제공이 가능한 한도 내에서 제공하며, 이에 대한 내용 및 수준을 보장하지는 않습니다.\n"
              "② 회사는 본 서비스 이용에 관련하여 개인정보 보호방침이 규정하는 내용에 대응하지 않는 사항에 대해서는 손해가 발생하더라도 책임을 지지 않습니다.\n"
              "③ 본 서비스를 통해 회원간에 주고받은 정보 및 그에 따라 이루어진 행위에 대하여 회사는 책임지지 않습니다.\n"
              "④ 회사는 본 서비스를 이용해 발생한 회원의 모든 손해에 대하여 회사의 고의 또는 중과실에 의한 경우를 제외하고 어떠한 책임도 해당 손해배상 의무도 갖지 않습니다.\n"
              "⑤ 포인트 서비스 제휴 사이트에 관하여 회사는 해당사이트에 대한 안정성, 정확성, 적법성, 목적적합성 등에 관하여 보증도 책임도 지지 않습니다.\n"
              "⑥ 회사가 회원이 등록 또는 게재한 정보를 삭제해 해당회원이 회원자격 정지ㆍ말소로 인해 본 서비스가 정지, 중단, 중지 등이 된 경우, 회사는 이유여하를 불문하고 일체의 손해배상의무를 지지 않습니다.\n"
              "⑦ 회사가 설정한 포인트지급금액, 캐시지급수수료 에 대하여 회사는 언제든지 신규 설정, 변경 또는 종료할 수 있습니다.\n"
              "⑧ 구매한 포인트를 이용하지 못한 경우, 회사는 이용하지 않은 포인트에 대해 보상의 책임을 지지 않습니다.\n"
              "⑨ 회사는 가맹사이트가 규정한 기준에 대하여 책임을 지지 않습니다. 해당 기준에 의하여 회원의 성과가 승인되지 않거나 취소 또는 조정되는 등 회원에게 어떠한 손해, 비용 등이 발생하더라도, 회사는 이를 보상하지 않습니다.\n",
                tabIn: 2,
              ),


              title('제8장 개인정보', size: 17),
              title('제33조 개인정보의 취급', size: 15),
              const SizedBox(height: 0),

              description(
                "① 회사는 개인정보를 별도 온라인 상에 게시한 개인정보 보호방침에 의거하여 적절하게 취급합니다.\n"
               "② 회사는 개인정보를 아래의 이용목적 범위 내에서 취급합니다.\n"
              "1. 회사가 제공하는 본 서비스의 컨텐츠와 본 서비스 자체의 품질의 향상 - 회사의 새로운 서비스 안내\n"
             "2. 기타 회원이 동의한 범위 내의 이용제9장 기타\n",
                tabIn: 2,
              ),
              title('제34조 지적재산권 등의 귀속', size: 15),
              const SizedBox(height: 0),

              description(
                "회원은 사용자 컨텐츠를 제공함과 동시에 저작권 등에 대하여 사용료가 발생불가, 비독점적, 영속적, 취소불능, 완전하게 서브 라이센스할 수 있는 권리 (해당 회원의 개별 승인 및 해당 회원에게 보상할 필요없이 회사가 전세계의 모든 매체상에서 사용자 컨텐츠를 사용, 복제, 수정, 변경, 발표, 번역 또는 파생저작권을 제작, 발신, 실행, 게시할 수 있는 권리를 포함합니다) 를 회사 및 관계회사에 대하여 제공했다고 간주합니다.",
                tabIn: 2,
              ),
              title('제35조 링크', size: 15),
              const SizedBox(height: 0),

              description(
                "회사는 제3자기관의 웹사이트/어플리케이션의 서비스 또는 제3자기관의 웹사이트/어플리케이션에서 선전, 제공 또는 판매하는 어떠한 제품 또는 서비스에 대해서도 보증하지 않습니다. 제3자기관의 웹사이트/어플리케이션은 회사가 확인을 하지 않습니다. 회사는 제3자기관의 웹사이트/어플리케이션상의 개인정보보호 실시 및 운영절차 방법뿐만 아니라 제3자기관의 웹사이트/어플리케이션에 포함된 컨텐츠에 관해서 어떠한 책임도 지지 않습니다. 회사는 웹사이트/어플리케이션을 운영, 소유한 제3자기관의 사업 및 개인정보보호 실시상황 및 제품과 서비스를 포함한 제3자기관의 웹사이트/어플리케이션에 관하여 명시적 또는 묵시적인 보증을 일체 하지 않습니다.",
                tabIn: 2,
              ),
              title('제36조 이용 계약의 성립', size: 15),
              const SizedBox(height: 0),

              description(
                "회원이 회사에 대하여 유료서비스 이용 신청을 하고, 회사가 이에 대해 승낙함으로써 회원과 회사간의 유료서비스 이용계약이 성립됩니다.",
                tabIn: 2,
              ),
              title('제37조 관할법원', size: 15),
              const SizedBox(height: 0),

              description(
                "본 약관에 관한 소송의 관할법원은 회사의 소재지를 관할하는 법원으로 합니다.",
                tabIn: 2,
              ),
              title('부 칙', size: 15),
              description(
                "본 약관은 2023년 04월 01일부터 적용됩니다.",
                tabIn: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
