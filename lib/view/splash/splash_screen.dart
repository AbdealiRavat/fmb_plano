import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb_app/util/colors.dart';
import 'package:fmb_app/util/constant.dart';
import 'package:fmb_app/view/auth/screens/login_screen.dart';
import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigateToScreen();
    });
    super.initState();
  }

  navigateToScreen() {
    SharedPrefs.getIntroBool('isLoggedIn')
        ? Get.offAll(() => const HomeScreen(), arguments: ['home', 'Home'])
        : Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          'asset/icons/icon.png',
          height: 250.h,
          // width: 200.w,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
