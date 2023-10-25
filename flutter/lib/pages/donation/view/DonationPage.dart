import 'package:flutter/material.dart';
import 'package:givoo/pages/donation/view/DonationResultPage.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:go_router/go_router.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DonationPage extends StatelessWidget {
  DonationPage({super.key,required this.data});
  var data;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DonationProvider>(context, listen: false);
    return IamportPayment(
      appBar: new AppBar(
        title: new Text('아임포트 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: provider.donationKey,
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
          pg: 'html5_inicis',                                          // PG사
          payMethod: 'kakaopay',                                           // 결제수단
          name: data['orgName'],                                  // 주문명
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
          amount: data['amount'],                                               // 결제금액
          buyerName: data['name'],                                           // 구매자 이름
          buyerTel: '01012345678',                                     // 구매자 연락처
          buyerEmail: data['email'],                            // 구매자 이메일
          buyerAddr: data['address'],                         // 구매자 주소
          buyerPostcode: '',                                      // 구매자 우편번호
          appScheme: 'example',                                        // 앱 URL scheme
          cardQuota : [2,3]                                            //결제창 UI 내 할부개월수 제한
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        result.isSuccessed? Provider.of<DonationProvider>(context,listen:false).sendDonation(LoginViewModel.userId,data['orgId'],data['amount'],data['orgName']): "";
       context.push("/donationresult",extra: result);
      },
    );
  }
}