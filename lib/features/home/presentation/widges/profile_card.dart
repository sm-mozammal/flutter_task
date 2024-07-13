import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import Get package for reactive state management
import 'package:image_picker/image_picker.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
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
      child: GetBuilder<AuthController>(
        builder: (provider) {
          return Row(
            children: [
              ClipOval(
                child: ValueBuilder<XFile?>(
                  initialValue: provider.imageFile,
                  builder: (imageFile, updateFn) {
                    return imageFile != null
                        ? Image.file(
                            File(imageFile.path),
                            height: 60.h,
                            width: 60.w,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            Assets.images.profile.path,
                            height: 60.h,
                            width: 60.w,
                            fit: BoxFit.cover,
                          );
                  },
                ),
              ),
              UIHelper.horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      provider.fullName,
                      style:
                          TextFontStyle.headline20StylenotoSerifBengaliTextBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    provider.companyName,
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
                        provider.location,
                        style: TextFontStyle.headline14StylenotoSerifBengali,
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
