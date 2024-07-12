import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 327.w,
        // height: 98.h,
        padding: EdgeInsets.all(12.r),
        decoration: ShapeDecoration(
          color: AppColors.cFFFFFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 2.r,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(children: [
          ClipOval(
              child: Image.asset(
            Assets.images.profile.path,
            height: 60.h,
            width: 60.w,
          )),
          UIHelper.horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'মোঃ মোহাইমেনুল রেজা',
                style: TextFontStyle.headline20StylenotoSerifBengaliTextBold,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'সফটবিডি লিমিটেড',
                style: TextFontStyle.headline14StylenotoSerifBengali,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: AppColors.c6A6A6A,
                    size: 16.sp,
                  ),
                  Text(
                    'ঢাকা',
                    style: TextFontStyle.headline14StylenotoSerifBengali,
                  ),
                ],
              )
            ],
          )
        ]));
  }
}
