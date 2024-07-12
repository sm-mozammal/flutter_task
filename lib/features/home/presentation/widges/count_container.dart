import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class CountContainer extends StatelessWidget {
  final String? text;
  const CountContainer({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: AppColors.cF6F6F6,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: AppColors.cFF737A),
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text!,
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12StylenotoSerifBengali500,
          ),
        ],
      ),
    );
  }
}
