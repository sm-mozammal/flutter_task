import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class MenuCared extends StatelessWidget {
  final String? menu;
  final String? image;
  const MenuCared({
    super.key,
    this.menu,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72.w,
          height: 74.h,
          padding: EdgeInsets.all(20.sp),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.cF6F6F6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: SvgPicture.asset(image!),
        ),
        Text(
          menu!,
          textAlign: TextAlign.center,
          style: TextFontStyle.headline16StylenotoSerifBengali,
        )
      ],
    );
  }
}
