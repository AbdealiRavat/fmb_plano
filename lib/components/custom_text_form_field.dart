import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import '../util/common.dart';

class CustomTextFormField extends StatefulWidget {
  final String hinttext;
  final bool obsecuretext;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.hinttext,
    required this.obsecuretext,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obsecuretext,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          contentPadding:  EdgeInsets.all(18.r),
          // border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: AppColors.secondary, width: 2.w),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12.r)),
          hintText: widget.hinttext,
          hintStyle: Common().hinttext),
    );
  }
}

class CustomElevatedButton extends StatefulWidget {
  final String message;
  final FutureOr<void> Function() function;
  final Color? color;
  const CustomElevatedButton({
    Key? key,
    required this.message,
    required this.function,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });
        if (widget.function != null) {
          await widget.function!();
        }

        setState(() {
          loading = false;
        });
      },
      style: ButtonStyle(
          side:  MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
          fixedSize:  MaterialStatePropertyAll(Size.fromWidth(370.w)),
          padding:  MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20.w),
          ),
          backgroundColor: MaterialStatePropertyAll(widget.color)),
      child: loading
          ? const CupertinoActivityIndicator()
          : FittedBox(
              child: Text(
              widget.message,
              style: Common().semiboldwhite,
            )),
    );
  }
}
