import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/config/loading.dart';
import 'package:givoo/pages/donation/view/DonationPage.dart';
import 'package:givoo/pages/donation/view/DonationResultPage.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/mypage/view/announcement.dart';
import 'package:givoo/pages/mypage/view/InquiryDetail.dart';
import 'package:givoo/pages/mypage/view/dntBillRequest.dart';
import 'package:givoo/pages/mypage/view/dntBillSend.dart';
import 'package:givoo/pages/mypage/view/inquiry.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/pages/mypage/view/mypage_setting.dart';
import 'package:givoo/pages/mypage/view/privacy_policy.dart';
import 'package:givoo/pages/organization_info/view/org_info.dart';
import 'package:givoo/pages/pay/view/pay.dart';
import 'package:givoo/pages/recommend/view/recommendPage.dart';
import 'package:givoo/pages/search/view/search.dart';
import 'package:go_router/go_router.dart';

import '../component/view/bottomnavbar.dart';
import '../pages/login/view/login_agreement.dart';
import '../pages/login/view/login_first.dart';
import '../pages/mypage/view/givoo_explanation.dart';
import '../pages/mypage/view/mypage_terms.dart';
import '../pages/mypage/view/q&a_page.dart';
import '../pages/mypage/view/terms_condition.dart';

class GivooRouter {
  // 로그인 상태
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Loading();
        },
      ),
      GoRoute(
        path: '/main',
        builder: (BuildContext context, GoRouterState state) {
          return const BotNavBar();
        },
      ),
      GoRoute(
        path: '/donationresult',
        builder: (BuildContext context, GoRouterState state) {
          Object? data = state.extra;
          return DonationResult(data: data as PaymentResultPayload);
        },
      ),
      GoRoute(
        path: '/donation',
        builder: (BuildContext context, GoRouterState state) {
          Object? data = state.extra;
          return DonationPage(data: data);
        },
      ),

      GoRoute(
        path: '/pay/:orgId',
        builder: (BuildContext context, GoRouterState state) {
          final orgId = int.parse(state.pathParameters['orgId']!) ?? '-1';
          return Pay(orgId: orgId.toString());
        },
      ),
      GoRoute(
        path: '/Recommend',
        builder: (BuildContext context, GoRouterState state) {
          final orgType = state.extra;
          return RecommendPage(
            orgType: orgType.toString(),
          );
        },
      ),
      GoRoute(
        path: '/Search',
        builder: (BuildContext context, GoRouterState state) {
          return const Search();
        },
      ),
      GoRoute(
        path: '/orginfo/:orgId',
        builder: (BuildContext context, GoRouterState state) {
          final orgId = int.parse(state.pathParameters['orgId']!) ?? '-1';
          return OrgInfo(orgId: orgId.toString());
        },
      ),
      GoRoute(
        path: '/login/first',
        builder: (BuildContext context, GoRouterState state) {
          //final token = int.parse(state.pathParameters['token']!) ?? '-1';
          return FirstLogin();
        },
      ),
      GoRoute(
          path: '/mypage',
          builder: (BuildContext context, GoRouterState state) {
            return const MyPage();
          },
          routes: [
            GoRoute(
              // 내 단체
              path: 'org',
              builder: (context, state) => MainMyGroup(),
            ),
            GoRoute(
              // 기부 이력 확인
              path: 'dnthistory',
              builder: (context, state) => DonationHistory(),
            ),
            GoRoute(
              // 기부금 공제란?
              path: 'tax',
              builder: (context, state) => Tax(),
            ),
            GoRoute(
              // 공지사항
              path: 'announcement',
              builder: (context, state) => Announcement(),
            ),
            GoRoute(
              // QnA
              path: 'qna',
              builder: (context, state) => QNA(),
            ),
            GoRoute(
              // 약관 및 정책
              path: 'terms',
              builder: (context, state) => Mypage_terms(),
            ),
            GoRoute(
              path: 'dntbillsend',
              builder: (context, state) => DntBillSend(),
            ),
            GoRoute(
              path: 'dntbillrequest',
              builder: (context, state) => DntBillRequest(),
            ),
            GoRoute(
              path: 'inquiry',
              builder: (context, state) => Inquiry(),
            ),
            GoRoute(
              // 내 단체
              path: 'inquiry/:idx',
              builder: (context, state) {
                 int idx = int.parse(state.pathParameters['idx']!) ?? -1;
                return InquiryDetail(idx: idx);
              },
            ),
            // 개인 설정
            GoRoute(
              path: 'settings',
              builder: (context, state) => SettingPage(),
            ),
          ]),
      GoRoute(
          path: '/kakaologin',
        builder: (context, state) => logIn(),
      ),
      GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginSignupScreen();
          },
          routes: [
            GoRoute(
              // 개인정보처리방침
              path: 'pp',
              builder: (context, state) => PrivacyPolicy(),
            ),
            GoRoute(
              // 이용약관 및 정책
              path: 'terms',
              builder: (context, state) => TermsCondition(),
            ),
          ])
    ],
  );
}
