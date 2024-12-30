import 'package:fmb_app/view/home/screens/feedback_screen.dart';
import 'package:fmb_app/view/home/screens/helpline_screen.dart';
import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:fmb_app/view/home/screens/monthly_menu_screen.dart';
import 'package:fmb_app/view/home/screens/my_profile.dart';
import 'package:fmb_app/view/home/screens/stop_thaali.dart';
import 'package:fmb_app/view/home/screens/thaali_signup_screen.dart';
import 'package:get/get.dart';

import '../view/auth/screens/login_screen.dart';
import '../view/home/screens/filling_screen.dart';
import 'routes_name.dart';

abstract class Routes {
  static route() => [
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteName.home,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteName.monthlyMenu,
          page: () => const MonthlyMenuScreen(),
        ),
        GetPage(
          name: RouteName.thaaliSignup,
          page: () => const ThaaliSignupScreen(),
        ),
        GetPage(
          name: RouteName.stopThaali,
          page: () => const StopThaali(),
        ),
        GetPage(
          name: RouteName.myProfile,
          page: () => const MyProfile(),
        ),
        GetPage(
          name: RouteName.feedback,
          page: () => const FeedbackScreen(),
        ),
        GetPage(
          name: RouteName.helpline,
          page: () => const HelplineScreen(),
        ),
        GetPage(
          name: RouteName.filling,
          page: () => const FillingScreen(),
        ),
      ];
}
