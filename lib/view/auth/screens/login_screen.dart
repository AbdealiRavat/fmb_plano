import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb_app/view/auth/controller/login_controller.dart';
import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:get/get.dart';

import '../../../components/custom_text_form_field.dart';
import '../../../util/common.dart';
import '../../../util/fade_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding: EdgeInsets.all(10.w),
          children: [
            SizedBox(height: 45.h),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FadeInAnimation(
                delay: 1.3,
                child: Image.asset(
                  'asset/images/logo.png',
                  height: 250.h,
                  // width: 200.w,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 45.h),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: Column(
                  children: [
                    const FadeInAnimation(
                      delay: 1.9,
                      child: CustomTextFormField(
                        hinttext: 'Enter your ITS number',
                        obsecuretext: false,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInAnimation(
                      delay: 2.2,
                      child: Obx(() => TextFormField(
                            obscureText: loginController.flag.value,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(18),
                                hintText: "Enter your password",
                                hintStyle: Common().hinttext,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      loginController.flag.value = !loginController.flag.value;
                                    },
                                    icon: const Icon(Icons.remove_red_eye_outlined))),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FadeInAnimation(
                      delay: 2.8,
                      child: CustomElevatedButton(
                        message: "Login",
                        function: () {
                          Get.to(() => HomeScreen());
                          if (flag) {
                            setState(() {
                              flag = false;
                            });
                          } else {
                            setState(() {
                              flag = true;
                            });
                          }
                        },
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: FadeInAnimation(
                delay: 1.3,
                child: Text(
                  'Helpdesk : fmb@planojamat.com',
                  textAlign: TextAlign.center,
                  style: Common().mediumTheme,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}