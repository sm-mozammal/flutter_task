// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print
import 'dart:async';
import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../common_widgets/action_button.dart';
import '../gen/assets.gen.dart';
import '/helpers/toast.dart';
import '../common_widgets/custom_button.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

Future<void> setInitValue() async {}

Future<void> initiInternetChecker() async {
  InternetConnectionChecker.createInstance(
          checkTimeout: const Duration(seconds: 1),
          checkInterval: const Duration(seconds: 2))
      .onStatusChange
      .listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        ToastUtil.showShortToast('Data connection is available.');
        break;
      case InternetConnectionStatus.disconnected:
        ToastUtil.showNoInternetToast();
        break;
    }
  });
}

void showMaterialDialog(
  BuildContext context,
) {
  showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Do you want to exit the app?",
              textAlign: TextAlign.center,
              style: TextFontStyle.headline14StylenotoSerifBengali,
            ),
            actions: <Widget>[
              customeButton(
                  name: "No",
                  onCallBack: () {
                    Navigator.of(context).pop(false);
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.cF0F0F0,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: AppColors.c3EE1D0,
                      fontWeight: FontWeight.w700),
                  context: context),
              customeButton(
                  name: "Yes",
                  onCallBack: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.c3EE1D0,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  context: context),
            ],
          ));
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void showCustomAlertDialog(BuildContext context, {VoidCallback? onAction}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
                Assets.svgs.alertSuccess), // Ensure this path is correct
            Text(
              'নতুন অনুচ্ছেদ সংরক্ষন',
              textAlign: TextAlign.center,
              style: TextFontStyle.headline16StylenotoSerifBengali700
                  .copyWith(height: 1.5),
            ),
            SizedBox(height: 8.h),
            Text(
              'আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পূর্ণ হয়েছে',
              textAlign: TextAlign.center,
              style: TextFontStyle.headline14StylenotoSerifBengali
                  .copyWith(height: 1.5),
            ),
            SizedBox(height: 16.h), // UIHelper.verticalSpaceMedium equivalent
            ActionButton(
              name: 'আরও যোগ করুন',
              height: 50.h,
              width: 290.w,
              borderRadius: 8.r,
              onTap: onAction ?? () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}

void changeFocus(
    {required BuildContext context,
    required FocusNode current,
    required FocusNode next}) {
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}

List<String> generateYears() {
  int currentYear = DateTime.now().year;
  return List<String>.generate(
      currentYear - 1900 + 1, (index) => (currentYear - index).toString());
}
