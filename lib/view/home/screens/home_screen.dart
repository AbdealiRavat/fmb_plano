import 'package:flutter/material.dart';
import 'package:fmb_app/components/app_drawer.dart';
import 'package:fmb_app/components/common_app_bar.dart';
import 'package:fmb_app/util/common.dart';
import 'package:fmb_app/view/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppbar(title: 'Home'),
        drawer: AppDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: Common().mediumThemeblack,
            )
          ],
        )),
      ),
    );
  }
}
