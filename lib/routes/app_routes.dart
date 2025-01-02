import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:fmb_app/view/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../view/auth/screens/login_screen.dart';
import 'routes_name.dart';

abstract class Routes {
  static route() => [
        GetPage(
          name: RouteName.splash,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteName.home,
          page: () => const HomeScreen(),
        ),
      ];
}
