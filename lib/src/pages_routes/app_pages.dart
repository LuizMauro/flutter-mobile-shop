import 'package:get/get.dart';
import 'package:teste/src/pages/auth/view/sign_in_screen.dart';
import 'package:teste/src/pages/auth/view/sign_up_screen.dart';
import 'package:teste/src/pages/base/base_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseScreenRoute,
      page: () => const BaseScreen(),
    )
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String baseScreenRoute = '/';
}
