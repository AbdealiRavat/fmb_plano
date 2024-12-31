import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmb_app/util/colors.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  CommonAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r))),
      backgroundColor: AppColors.primary,
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 22.sp, letterSpacing: 1, color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
