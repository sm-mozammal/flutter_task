// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print
import 'dart:async';
import 'dart:io';

import 'dart:developer' as dev;
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';

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

void showCustomAlertDialog2(BuildContext context, {VoidCallback? onAction}) {
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

void showCustomAlertDialog(BuildContext context,
    {VoidCallback? onAction, Widget? content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: content ??
            Column(
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
                SizedBox(
                    height: 16.h), // UIHelper.verticalSpaceMedium equivalent
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

void showPickImageBottomSheet(
  BuildContext context,
  ValueNotifier<List<XFile?>>? selectedImagesNotifier,
  void Function(XFile?)
      setImageFile, // Callback function to update imageFileNotifier
  {
  bool isCameraNeeded = true,
  bool isGalleryNeeded = true,
  bool areMultiPickImage = false,
}) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  showCupertinoModalPopup(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: TextStyleExample(
        name: 'Choose Image',
        style: textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 0.1,
        ),
      ),
      message: TextStyleExample(
        name: "Choose an image from your camera or existing gallery.",
        style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.1),
      ),
      actions: <Widget>[
        // List of actions
        if (isCameraNeeded)
          CupertinoActionSheetAction(
            child: TextStyleExample(
              name: 'Camera',
              style: textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: () async {
              XFile? pickedFile = await selectImageFromCamera(context);
              setImageFile(pickedFile); // Update imageFileNotifier
              Navigator.pop(context); // Close action sheet
            },
          ),
        if (isGalleryNeeded)
          CupertinoActionSheetAction(
            child: TextStyleExample(
              name: 'Gallery',
              style: textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            onPressed: () async {
              XFile? pickedFile = await selectImageFromGallery(context);
              setImageFile(pickedFile); // Update imageFileNotifier
              Navigator.pop(context); // Close action sheet
            },
          ),
      ],
      // Cancel button at the bottom of the modal popup
      cancelButton: CupertinoActionSheetAction(
        child: TextStyleExample(
          name: 'Close',
          style: textTheme.titleLarge!.copyWith(
            color: Colors.grey,
            letterSpacing: 0.1,
          ),
        ),
        onPressed: () {
          Navigator.pop(context); // Close action sheet
        },
      ),
    ),
  );
}

Future<XFile?> selectImageFromCamera(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  dev.log('pickedFile is: $pickedFile');
  return pickedFile;
}

Future<XFile?> selectImageFromGallery(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  dev.log('pickedFile is: $pickedFile');
  return pickedFile;
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({super.key, required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.sp),
      child: Text(name, style: style.copyWith(letterSpacing: 1.0)),
    );
  }
}

Future<void> multiPickImageFromGallery(BuildContext context,
    ValueNotifier<List<XFile?>>? selectedImagesNotifier) async {
  final ImagePicker picker = ImagePicker();
  final List<XFile?> images = await picker.pickMultiImage(
    imageQuality: 80,
  );

  if (images.isNotEmpty) {
    if (selectedImagesNotifier!.value.length + images.length > 3) {
      // Show a message or handle the case where the user tries to pick more than 3 images
      ToastUtil.showShortToast("You can only select up to 3 images.");

      // Collapse the modal popup menu for hiding bottom sheet (only when more than 3 images selected)
      if (context.mounted) {
        Navigator.pop(context);
      }

      return;
    }

    selectedImagesNotifier.value = List.from(selectedImagesNotifier.value)
      ..addAll(images.take(3 - selectedImagesNotifier.value.length));
  }

  // Collapse the modal popup menu for hiding bottom sheet
  if (context.mounted) {
    Navigator.pop(context);
  }
}

Future<dynamic> buildRequestPermissionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Permission Required'),
      content: const Text(
        'Please grant access to the camera and storage in settings to proceed.',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            openAppSettings(); // Open app settings
          },
          child: const Text('Open Settings'),
        ),
      ],
    ),
  );
}
