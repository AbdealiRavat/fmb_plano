import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Common {
  Color maincolor = const Color(0xFF35C2C1);
  Color white = const Color(0xFFF5F5F5);
  Color black = const Color(0xFF1E232C);

  TextStyle titelTheme =  TextStyle(
    fontSize: 30.sp,
    fontFamily: "Urbanist",
    fontWeight: FontWeight.bold,
    // color: Colors.white
  );
  TextStyle mediumTheme =  TextStyle(
      fontSize: 15.sp,
      fontFamily: "Urbanist-Bold",
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 72, 151, 151));

  TextStyle mediumThemeblack =  TextStyle(
    fontSize: 16.sp,
    fontFamily: "Urbanist-Bold",
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );

  TextStyle semiboldwhite =  TextStyle(
      fontSize: 15.sp,
      fontFamily: "Urbanist-SemiBold",
      fontWeight: FontWeight.bold,
      color: Colors.white);

  TextStyle semiboldblack = TextStyle(
    fontSize: 18.sp, fontFamily: "Urbanist-SemiBold",
    //  color: Colors.white
  );

  TextStyle hinttext =
       TextStyle(fontSize: 15.sp, fontFamily: 'Urbanist-Medium', color: Color(0xFF8391A1));
}
