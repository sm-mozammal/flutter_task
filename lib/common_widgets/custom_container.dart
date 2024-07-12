import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const CustomContainer({super.key, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12.r),
      decoration: ShapeDecoration(
        color: AppColors.cFDFDFD,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
