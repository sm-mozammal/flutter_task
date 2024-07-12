import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/constants/text_font_style.dart';

import '../gen/colors.gen.dart';

class ActionButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final List<Color> colors;
  final TextStyle? style;
  final bool isBorderSide;
  final double? borderRadius;

  const ActionButton({
    super.key,
    this.onTap,
    required this.name,
    this.height = 56,
    this.width = double.maxFinite,
    this.colors = const [AppColors.c86B560, AppColors.c336F4A],
    this.style,
    this.isBorderSide = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height?.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
          border: isBorderSide
              ? Border.all(width: 1.0, color: AppColors.c3EE1D0)
              : Border.all(width: 0.0, color: Colors.transparent),
          gradient: LinearGradient(colors: colors),
        ),
        child: Center(
            child: Text(
          name,
          style: style ?? TextFontStyle.headline12StylenotoSerifBengali700,
        )),
      ),
    );
  }
}
