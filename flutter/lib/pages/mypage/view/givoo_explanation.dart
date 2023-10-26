import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';

void main() => runApp(Tax());

class Tax extends StatelessWidget {
  const Tax({super.key});

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
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: BaseAppbar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/mypage/taxe.png',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title(' ■ 기부금 종류', size: 17),
                  ),
                  const SizedBox(height: 1),
                  description(
                    "ㆍ정치자금 기부금 : [정치자금에 관한 법률]에 따라 정당, 후원회 및 선거관리위원회에 기부한 정치자금\n"
                    "  예)후원금 기부, 선거관리위원회에 정치자금 기탁, 정당의 당원으로 당비 납부\n"
                    "ㆍ법정기부금: 국가나 지방단체에 기부금\n"
                    "   예) 국방헌금과 위문금품, 이재민 구호금, 불우이웃돕기 결연기관에 지출한 기부금\n"
                    " ㆍ우리사주조합기부금 : 우리사주조합원이 아닌 근로자가 우리사주조합에 지출하는 기부금\n"
                    " ㆍ지정기부금: 지정기부금단체 등의 고유목적사업비를 지출하는 기부금\n"
                    "  예) 교회 등의 종교단체, 사회복지법인에 지불한 기부금 .\n",
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title(' ■ 기부금 공제 대상 ', size: 17),
                  ),
                  description(
                    " 정치자금 기부금과 우리사주조합기부금은 근로자 본인이 기부한 경우에만 공제 가능합니다.\n"
                    " 법정기부금과 지정기부금은 나이제한없이 소득요건으로 기본공제 대상자인 배우자나 부양자의 기부금을 합산하여 세액공제 가능합니다.\n"
                    " 예를 들어, 소득이 없는 60세미만 부모님이나 대학생자녀의 지정기부금을 세액공제 받을 수 있습니다.    \n",
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(

                          'images/mypage/tax2.png',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title(' ■종류별 공제한도 X 공제율', size: 17),
                  ),
                  Container(
                    height: 200,
                    width: 600,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/mypage/tax3.png',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title(' ■ 제출서류', size: 17),
                  ),
                  const SizedBox(height: 1),
                  description(
                    "- 연말정산 간소화 PDF 자료\n"
                    " - 기부금 영수증\n"
                    " * 기부금 자료제출은 의무사항이 아니기 때문에 연말정산 간소화 서비스에서 확인이 안 될 경우,\n"
                    " 기부금 접수단체에 자료를 발급받으셔야 합니다.\n",
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: title('■ 기부금 세액공제 FAQ ', size: 17),
                  ),
                  const SizedBox(height: 1),
                  description(" Q1. 소득이 없는 배우자나 부모님이 지급한 기부금도 세액공제 대상인가요?\n"
                      "   A. 배우자와 부양가족의 지출분은 연간 소득금액 100만원(근로소득만 있는경우 총급여액 500만원)이하인 자의 지출분은 공제가능합니다.\n"
                      " Q2. 기본공제대상에 해당하지 않는 배우자가 기부한 금액도 근로자 본인이 세액공제 받을 수 있나요?\n"
                      "  A. 근로자 본인의 기본공제 대상자가 아닌 배우자의 기부금은 근로자 본인이 세액공제 받을 수 없습니다.\n"
                      " Q3. 종교단체에 지출한 기부금은 모두 공제받을 수 있는 기부금인가요?\n"
                      "  A. 종교의 보급 기타 교화를 목적으로 설립하여 주무관청에 등록된 단체에 지출한 기부금만 공제대상에 해당합니다.\n"
                      " Q4. 인터넷으로 발급받은 기부금영수증도 인정되나요?\n"
                      "  A. 온라인상(인터넷)에서 발급되는 기부금 영수증은 소득공제 가능서류가 아닙니다.\n"),
                ],
              ),
            ), //
          ),
        ),
      );
  }
}
