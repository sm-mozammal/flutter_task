import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/constants/text_font_style.dart';
import '../gen/colors.gen.dart';

// ignore: must_be_immutable
final class CustomFormField extends StatelessWidget {
  String? hintText;
  final String? labelText;
  TextEditingController? textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  final String? Function(String?)? validator;
  bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  bool isObsecure;
  bool isPass;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Function(String)? onFieldSubmitted;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final bool readOnly;
  final bool? showCorsor;
  final double? cursorHeight;

  final Color? focusedErrorBorderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? enabledBorderColor;

  CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.textEditingController,
    required this.inputType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.focusedErrorBorderColor,
    this.focusedBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.showCorsor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('textfiled on tap');
      },
      child: TextFormField(
        showCursor: showCorsor ?? true,
        cursorHeight: cursorHeight ?? 20.h,
        cursorColor: AppColors.c22252D,
        focusNode: focusNode,
        obscureText: isPass ? isObsecure : false,
        textInputAction: textInputAction,
        autovalidateMode:
            validation! ? AutovalidateMode.always : AutovalidateMode.disabled,
        validator: validator,
        maxLines: maxline ?? 1,
        controller: textEditingController,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        enabled: isEnabled,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: AppColors.cFDFDFD,
          filled: true,
          prefixIcon: prefixIcon,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          hintText: hintText,
          hintStyle: TextFontStyle.headline14StylenotoSerifBengali,
          labelText: labelText,
          labelStyle: labelStyle ??
              TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.c8993A4,
              ),
          errorStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            borderSide: BorderSide(
              color: focusedErrorBorderColor ?? AppColors.cdfe1e6,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            borderSide: BorderSide(
              color: AppColors.cF2F2F2,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            borderSide: BorderSide(
              color: AppColors.cF2F2F2,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            borderSide: BorderSide(
              color: errorBorderColor ?? Colors.red,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            borderSide: BorderSide(
              color: AppColors.cF2F2F2,
              width: 1.5,
            ),
          ),
        ),
        style: style ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.c22252D,
            ),
        keyboardType: inputType,
      ),
    );
  }
}
