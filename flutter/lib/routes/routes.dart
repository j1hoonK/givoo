import 'package:flutter/cupertino.dart';
import 'package:givoo/config/loading.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/pages/organization_info/view/org_info.dart';
import 'package:givoo/pages/pay/view/pay.dart';
import 'package:givoo/pages/recommend/view/recommend.dart';
import 'package:givoo/pages/search/view/search.dart';
import 'package:go_router/go_router.dart';

import '../pages/login/view/login_first.dart';

class GivooRouter {
  // 로그인 상태
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Loading();
        },
      ), GoRoute(
        path: '/pay/:orgId',
        builder: (BuildContext context, GoRouterState state) {
          final orgId = int.parse(state.pathParameters['orgId']!) ?? '-1';
          return Pay(orgId: orgId.toString());
        },
      ),GoRoute(
        path: '/Recommend',
        builder: (BuildContext context, GoRouterState state) {
          final orgType = state.extra;
          return  Recommend(orgType: orgType.toString(),);
        },
      ), GoRoute(
        path: '/Search',
        builder: (BuildContext context, GoRouterState state) {
          return const Search();
        },
      ),
      GoRoute(
        path: '/mypage',
        builder: (BuildContext context, GoRouterState state) {
          return const MyPage();
        },
      ),
      GoRoute(
        path: '/mypage/org',
        builder: (BuildContext context, GoRouterState state) {
          return const MainMyGroup();
        },
      ),
      GoRoute(
        path: '/mypage/dnthistory',
        builder: (BuildContext context, GoRouterState state) {
          return const DonationHistory();
        },
      ),
      GoRoute(
        path: '/orginfo/:orgId',
        builder: (BuildContext context, GoRouterState state) {
          final orgId = int.parse(state.pathParameters['orgId']!) ?? '-1';
          return OrgInfoPage(orgId : orgId.toString());
        },
      ),
      GoRoute(
        path: '/login/first',
        builder: (BuildContext context, GoRouterState state) {
          //final token = int.parse(state.pathParameters['token']!) ?? '-1';
          return FirstLogin();
        },
      ),
    ],
  );
}





