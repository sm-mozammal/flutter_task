import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  static final headline18StyleManropeTextBold = GoogleFonts.manrope(
    color: AppColors.headLine1Color,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400, // Bold
  );

  static final headline10StyleMontserrat600 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 10.sp, fontWeight: FontWeight.w600);
  static final headline9StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 9.sp, fontWeight: FontWeight.w400);
  static final headline9StyleMontserrat700 = GoogleFonts.montserrat(
      color: AppColors.cFEFFFE, fontSize: 9.sp, fontWeight: FontWeight.w700);
  static final headline8StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 8.sp, fontWeight: FontWeight.w400);
  static final headline7StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 7.sp, fontWeight: FontWeight.bold);
  static final headline14StyleMontserrat300 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 14.sp, fontWeight: FontWeight.w300);
  static final headline14StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c000000, fontSize: 14.sp, fontWeight: FontWeight.w400);
}
