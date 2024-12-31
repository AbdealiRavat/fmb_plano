import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/routes_name.dart';
import '../view/home/controller/home_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                top: 0,
                child: SvgPicture.asset(
                  'asset/svg/bg.svg',
                  semanticsLabel: 'bg Image',
                  // fit: BoxFit.contain,
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 0.22.sh,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
                // decoration: BoxDecoration(color: Colors.amber),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anjuman-e-Taheri',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      'FMB - Plano',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: homeController.drawerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.amberAccent.withOpacity(0.2),
                  splashFactory: InkRipple.splashFactory,
                  onTap: () {
                    print(Get.currentRoute);
                    // Get.currentRoute == ;
                    // homeController.isSelected[index] = true;
                    if (index != 8) {
                      String name = index == 0
                          ? RouteName.home
                          : index == 1
                              ? RouteName.monthlyMenu
                              : index == 2
                                  ? RouteName.thaaliSignup
                                  : index == 3
                                      ? RouteName.stopThaali
                                      : index == 4
                                          ? RouteName.myProfile
                                          : index == 5
                                              ? RouteName.feedback
                                              : index == 6
                                                  ? RouteName.helpline
                                                  : RouteName.filling;
                      Get.back();
                      Get.offNamed(name);
                      print(index);
                    } else {
                      Get.back();
                      Get.offNamed(RouteName.loginScreen);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: Row(
                      children: [
                        Image.asset(
                          homeController.drawerList[index].icon,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Obx(() => Text(
                              homeController.drawerList[index].title,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
