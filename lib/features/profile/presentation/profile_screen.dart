import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../../../common_widgets/action_button.dart';
import '../../../common_widgets/custome_textfield.dart';
import '../../../constants/text_font_style.dart';
import '../../../controller/auth_controller.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/helper_methods.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final AuthController controller = Get.put(AuthController());

  // Controllers
  final TextEditingController companyController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController fnController = TextEditingController();

  @override
  void dispose() {
    // Controllers
    companyController.dispose();
    locationController.dispose();
    fnController.dispose();

    // _profileImageFileNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      fnController.text = "এস এম মোজাম্মেল হোসেন";
      companyController.text = "সফটবিডি লিমিটেড";
      locationController.text = "ব্রাহ্মণবাড়িয়া";
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(40.h),

            // Profile Image Section
            _buildProfileImageSection(),

            UIHelper.verticalSpace32,

            // Full Name Input Field
            _buildInputSection(
              controller: fnController,
              hintText: "পুরো নাম",
              prefixIcon: Assets.svgs.profileTf,
              onChanged: (value) => controller.setFullName(value),
            ),
            UIHelper.verticalSpaceMedium,

            // Company Input Field
            _buildInputSection(
              controller: companyController,
              hintText: "কোম্পানির নাম",
              prefixIcon: Assets.svgs.companyTf,
              onChanged: (value) => controller.setCompanyName(value),
            ),
            UIHelper.verticalSpaceMedium,

            // Location Input Field
            _buildInputSection(
              controller: locationController,
              hintText: "ঠিকানার নাম",
              prefixIcon: Assets.svgs.locationTf,
              onChanged: (value) => controller.setLocation(value),
            ),
            UIHelper.verticalSpaceMedium,

            UIHelper.verticalSpaceSmall,
            UIHelper.verticalSpaceMedium,

            // Save Button
            _buildSaveButton(context),
            UIHelper.verticalSpaceMediumLarge,
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'প্রোফাইল',
        style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        CircleAvatar(
          radius: 76.r,
          backgroundColor: AppColors.cFFFFFF,
          child: CircleAvatar(
            radius: 74.r,
            backgroundColor: AppColors.cF4F5F7,
            child: GetBuilder<AuthController>(
              builder: (provider) {
                return ValueBuilder<XFile?>(
                  initialValue: provider.imageFile,
                  builder: (imageFile, updateFn) {
                    return imageFile != null
                        ? ClipOval(
                            child: Image.file(
                              File(imageFile.path),
                              height: 150.h,
                              width: 150.h,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                              Assets.images.profile.path,
                              height: 150.h,
                              width: 150.h,
                              fit: BoxFit.cover,
                            ),
                          );
                  },
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: () {
              _showImagePickerDialog(Get.context!);
            },
            child: Container(
              padding: EdgeInsets.all(1.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cFFFFFF,
              ),
              child: SvgPicture.asset(
                Assets.svgs.circularProfileEdit,
                height: 32.h,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInputSection({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    String? prefixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return CustomFormField(
      textEditingController: controller,
      hintText: hintText,
      inputType: TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.next,
      prefixIcon: (prefixIcon != null)
          ? Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(prefixIcon),
            )
          : null,
      onChanged: onChanged,
      validator: validator,

      // Colors
      errorBorderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      focusedBorderColor: Colors.transparent,
      disabledBorderColor: Colors.transparent,
      focusedErrorBorderColor: Colors.transparent,
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ActionButton(
      name: "সংরক্ষন করুন",
      onTap: () {
        controller.setFullName(fnController.text.trim());
        controller.setCompanyName(companyController.text.trim());
        controller.setLocation(locationController.text.trim());
        _saveProfile(context);
      },
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showPickImageBottomSheet(
      context,
      null,
      (pickedFile) {
        if (pickedFile != null) {
          // Update the imageFileNotifier using the setter method
          controller.setImageFile(pickedFile);
        }
      },
    );
  }

  void _saveProfile(BuildContext context) {
    showCustomAlertDialog(
      context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.svgs.alertSuccess),
          Text(
            'নতুন তথ্য সংরক্ষন',
            textAlign: TextAlign.center,
            style: TextFontStyle.headline16StylenotoSerifBengali700.copyWith(
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'আপনার প্রোফাইলে নতুন তথ্য সংরক্ষণ সম্পূর্ণ হয়েছে',
            textAlign: TextAlign.center,
            style: TextFontStyle.headline14StylenotoSerifBengali
                .copyWith(height: 1.5),
          ),
          SizedBox(height: 16.h),
          ActionButton(
            name: 'সংরক্ষন করুন',
            height: 50.h,
            width: 290.w,
            borderRadius: 8.r,
            onTap: () {
              NavigationService.goBack();
            },
          ),
        ],
      ),
    );
  }
}
