import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb_app/util/colors.dart';
import 'package:fmb_app/view/auth/controller/login_controller.dart';
import 'package:get/get.dart';

import '../../../components/custom_text_form_field.dart';
import '../../../util/common.dart';
import '../../../util/fade_animation.dart';
import '../../../util/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  TextEditingController itsController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    loginController.getFcmToken();
    // loginController.getVersionInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding: EdgeInsets.all(10.w),
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: FadeInAnimation(
                delay: 1.3,
                child: Image.asset(
                  'asset/icons/icon.png',
                  height: 250.h,
                  // width: 200.w,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: Column(
                  children: [
                    FadeInAnimation(
                      delay: 1.9,
                      child: CustomTextFormField(
                        controller: itsController,
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
                            controller: passwordController,
                            obscureText: loginController.flag.value,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(18.r),
                                hintText: "Enter your password",
                                hintStyle: Common().hinttext,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.secondary, width: 2.w),
                                    borderRadius: BorderRadius.circular(12.r)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      loginController.flag.value = !loginController.flag.value;
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20.w,
                                    ))),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FadeInAnimation(
                      delay: 2.8,
                      child: CustomElevatedButton(
                        message: "Login",
                        function: () async {
                          if (itsController.text.isEmpty) {
                            CommonToast.showDialog('Enter ITS number');
                          } else if (passwordController.text.isEmpty) {
                            CommonToast.showDialog('Enter password');
                          } else {
                            await loginController.login(
                                itsController.text, passwordController.text);
                            itsController.clear();
                            passwordController.clear();
                            // Get.to(() => HomeScreen());
                          }

                          // Get.to(() => HomeScreen());
                        },
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: GestureDetector(
                onTap: () {
                  loginController.openMail();
                },
                child: FadeInAnimation(
                  delay: 1.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Helpdesk : ',
                        textAlign: TextAlign.center,
                        style: Common().mediumTheme,
                      ),
                      Text(
                        'fmbsingapore@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "Urbanist-Bold",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 72, 151, 151),
                            color: Color.fromARGB(255, 72, 151, 151)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.w),
              child: FadeInAnimation(
                delay: 1.3,
                child: Text(
                  'Powered by Saify Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "Urbanist-Bold",
                      fontWeight: FontWeight.w400,
                      color: AppColors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.w),
              child: FadeInAnimation(
                delay: 1.3,
                child: Text(
                  'v2.4.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Urbanist-Bold",
                      fontWeight: FontWeight.w300,
                      color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
