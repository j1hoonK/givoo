import 'package:flutter/cupertino.dart';
import 'package:givoo/config/loading.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/pages/mypage/view/privacy_policy.dart';
import 'package:givoo/pages/organization_info/view/org_info.dart';
import 'package:givoo/pages/pay/view/pay.dart';
import 'package:givoo/pages/recommend/view/recommendPage.dart';
import 'package:givoo/pages/search/view/search.dart';
import 'package:go_router/go_router.dart';
import '../component/view/bottomnavbar.dart';
import '../pages/login/view/login_agreement.dart';
import '../pages/login/view/login_first.dart';
import '../pages/mypage/view/announcement.dart';
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
            GoRoute(  // 내 단체
              path: 'org',
              builder: (context, state) => MainMyGroup(),
            ),
            GoRoute(  // 기부 이력 확인
              path: 'dnthistory',
              builder: (context, state) => DonationHistory(),
            ),
            GoRoute(  // 공지사항
              path: 'announce',
              builder: (context, state) => Announce(),
            ),
            GoRoute(  // QnA
              path: 'qna',
              builder: (context, state) => faqpage(),
            ),
            GoRoute(  // 약관 및 정책
              path: 'terms',
              builder: (context, state) => TermsCondition(),
            ),
          ]),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return LoginSignupScreen();
        },
          routes: [
            GoRoute(  // 개인정보처리방침
              path: 'pp',
              builder: (context, state) => PrivacyPolicy(),
            ),

            GoRoute(  // 이용약관 및 정책
              path: 'terms',
              builder: (context, state) => TermsCondition(),
            ),
          ]
      )
    ],
  );
}
