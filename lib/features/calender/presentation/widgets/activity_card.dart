import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/dateuitl.dart';
import '../../../../helpers/ui_helpers.dart';

class ActivityCard extends StatelessWidget {
  final int index;
  final Datum data;
  const ActivityCard({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormatedUtils.formatTime(data.date!),
          // 'সকাল \n১১:০০ মি.',
          textAlign: TextAlign.center,
          style: (index + 1) % 2 == 0
              ? TextFontStyle.headline14StylenotoSerifBengali500
                  .copyWith(color: AppColors.c2A61EE)
              : TextFontStyle.headline14StylenotoSerifBengali500,
        ),
        Container(
          width: 207.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: (index + 1) % 2 == 0
                ? LinearGradient(colors: [AppColors.c000000, AppColors.c000000])
                : LinearGradient(
                    colors: [AppColors.c86B560, AppColors.c336F4A]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.svgs.clockCircle),
                  UIHelper.horizontalSpace(6.h),
                  Text('${DateFormatedUtils.stringTime(data.date!)} মি.',

                      // '১১:০০ মি.',
                      style: TextFontStyle.headline12StylenotoSerifBengali500
                          .copyWith(color: AppColors.cFDFDFD))
                ],
              ),
              UIHelper.verticalSpace(8.h),
              Text(data.name!,
                  style: TextFontStyle.headline14StylenotoSerifBengali600
                      .copyWith(color: AppColors.cFDFDFD)),
              UIHelper.verticalSpace(8.h),
              Text(data.category!,
                  style: TextFontStyle.headline12StylenotoSerifBengali500
                      .copyWith(color: AppColors.cFDFDFD)),
              UIHelper.verticalSpace(8.h),
              Row(
                children: [
                  SvgPicture.asset(Assets.svgs.mapPoint),
                  UIHelper.horizontalSpace(6.h),
                  Text(
                    data.location!,
                    style: TextFontStyle.headline12StylenotoSerifBengali500
                        .copyWith(color: AppColors.cFDFDFD),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
