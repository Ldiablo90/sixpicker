import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/oss_licenses.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/screens/main/sc_bill.dart';
import 'package:sixpicker/screens/main/sc_picker.dart';
import 'package:sixpicker/screens/onboarding/sc_on_boarding.dart';
import 'package:sixpicker/screens/public/sc_oss_detail.dart';
import 'package:sixpicker/screens/public/sc_oss_list.dart';
import 'package:sixpicker/screens/public/sc_setting.dart';
import 'package:sixpicker/utils/u_page.dart';
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final baseRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: PathOnBoarding.path,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(path: PathOnBoarding.path,name: PathOnBoarding.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: const OnBoarding())),
      GoRoute(path: PathPicker.path,name: PathPicker.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: const Picker())),
      GoRoute(path: PathBill.path,name: PathBill.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: const Bill())),
      GoRoute(path: PathSetting.path,name: PathSetting.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: const Setting()),
          routes: [
            GoRoute(path: PathOSSList.path,name: PathOSSList.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: const OpenSourceList()),
            routes: [
              GoRoute(path: PathOSSDetail.path,name: PathOSSDetail.name, pageBuilder: (context, state) => CustomScaffoldPage(type: ScreenTransitionType.fade, mChild: OpenSourceDetail(package: (state.extra) as Package,))),

            ]),

          ]),
    ],
  );
});

