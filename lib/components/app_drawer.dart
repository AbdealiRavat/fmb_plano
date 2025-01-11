import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmb_app/util/colors.dart';
import 'package:fmb_app/view/home/screens/home_screen.dart';
import 'package:get/get.dart';

import '../view/home/controller/home_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Drawer(
      backgroundColor: Colors.white,
      width: 0.7.sw,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    'asset/svg/bg.svg',
                    semanticsLabel: 'bg Image',
                    width: 0.7.sw,
                    // fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 0.22.sh,
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  // decoration: BoxDecoration(color: Colors.amber),
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: [
                      Text(
                        'Faizul Al Mawaid Al Burhaniyah ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        'Singapore',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
                itemCount: homeController.drawerList.length,
                physics: NeverScrollableScrollPhysics(),
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
                        // String name = index == 0
                        //     ? RouteName.home
                        //     : index == 1
                        //         ? RouteName.stopThaali
                        //         : index == 2
                        //             ? RouteName.changeThaali
                        //             : index == 3
                        //                 ? RouteName.monthlyMenu
                        //                 : index == 4
                        //                     ? RouteName.myProfile
                        //                     : index == 5
                        //                         ? RouteName.feedback
                        //                         : index == 6
                        //                             ? RouteName.helpline
                        //                             : RouteName.news;
                        String name = homeController.drawerList[index].urlName;
                        String title = homeController.drawerList[index].title;
                        Get.back();
                        Get.offAll(() => HomeScreen(), arguments: [name, title]);
                        print(index);
                      } else {
                        Get.back();
                        homeController.logout();
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
      ),
    );
  }
}
