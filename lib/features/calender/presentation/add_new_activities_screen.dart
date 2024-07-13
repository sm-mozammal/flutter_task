import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';
import 'package:flutter_task/helpers/navigation_service.dart';
import 'package:flutter_task/helpers/ui_helpers.dart';
import 'package:intl/intl.dart';
import '../../../common_widgets/action_button.dart';
import '../../../common_widgets/custome_textfield.dart';
import '../../../constants/text_font_style.dart';
import '../../../controller/date_controler.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/di.dart';
import '../../../helpers/helper_methods.dart';
import '../../../helpers/keyboard.dart';
import '../../../helpers/toast.dart';

class AddNewActivitiesScreen extends StatefulWidget {
  const AddNewActivitiesScreen({super.key});

  @override
  State<AddNewActivitiesScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<AddNewActivitiesScreen> {
  final pTitleController = TextEditingController();
  final pSectionController = TextEditingController();
  final pDatTimeController = TextEditingController();
  final pLocationController = TextEditingController();
  final pDescController = TextEditingController();
  ValueNotifier<int> descCharCount = ValueNotifier<int>(0);
  final formKey = GlobalKey<FormState>();
  String selectedDate =
      DateFormat('dd/MM/yyyy hh:mm', 'bn').format(DateTime.now());
  String milisecond = '';
  final DateController dateController = locator<DateController>();

  @override
  void dispose() {
    pTitleController.dispose();
    pDescController.dispose();
    pDatTimeController.dispose();
    pLocationController.dispose();
    pSectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(24.sp),
          children: [
            // Display the Heading Section
            _buildHeaderSection(
                leadingText: 'অনুচ্ছেদ', trailingText: '৪৫ শব্দ'),
            UIHelper.verticalSpace(8.h),

            // Input Filed
            _buildInputSection(
              inputFormatters: [LengthLimitingTextInputFormatter(45)],
              controller: pTitleController,
              hintText: 'অনুচ্ছেদ লিখুন',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'অনুগ্রহ করে আপনার অনুচ্ছেদ লিখুন';
                }
                if (value.length > 45) {
                  return '৪৫ শব্দের অধিক গ্রহণযোগ্য নহে';
                }
                return null;
              },
            ),
            UIHelper.verticalSpaceMedium,

            //Display Heading Section
            _buildHeaderSection(leadingText: 'অনুচ্ছেদের বিভাগ'),
            UIHelper.verticalSpace(8.h),

            // Input Filed
            _buildInputSection(
              controller: pSectionController,
              isSuffixNeeded: true,
              hintText: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'অনুগ্রহ করে আপনার অনুচ্ছেদের বিভাগ নির্বাচন করুন';
                }
                return null;
              },
            ),
            UIHelper.verticalSpaceMedium,

            _buildHeaderSection(leadingText: 'তারিখ ও সময়'),
            UIHelper.verticalSpace(8.h),

            GestureDetector(
              onTap: () async {
                log('onTap');
                _pickedDate(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDFDFD),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.85, color: Color(0xFFF2F2F2)),
                    borderRadius: BorderRadius.circular(6.78),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgs.calendarOutline,
                      height: 26.h,
                    ),
                    UIHelper.horizontalSpaceMedium,
                    Text(
                      selectedDate,
                      style: TextFontStyle.headline14StylenotoSerifBengali,
                    ),
                    Spacer(),
                    SvgPicture.asset(Assets.svgs.frontArrowIos, height: 26.h)
                  ],
                ),
                // child: _buildInputSection(
                //   // readOnly: true,
                //   // showCorsor: false,
                //   // inputType: TextInputType.none,
                //   controller: pDatTimeController,
                //   prefixIcon: Assets.svgs.calendarOutline,
                //   isSuffixNeeded: true,
                //   hintText: 'নির্বাচন করুন',
                //   // validator: (value) {
                //   //   if (value == null || value.isEmpty) {
                //   //     return 'অনুগ্রহ করে আপনার তারিখ নির্বাচন করুন';
                //   //   }
                //   //   return null;
                //   // },
                // ),
              ),
            ),
            UIHelper.verticalSpaceMedium,

            _buildHeaderSection(leadingText: 'স্থান'),
            UIHelper.verticalSpace(8.h),

            _buildInputSection(
              controller: pLocationController,
              prefixIcon: Assets.svgs.locationOutline,
              isSuffixNeeded: true,
              hintText: 'নির্বাচন করুন',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'অনুগ্রহ করে আপনার স্থান নির্বাচন করুন';
                }
                return null;
              },
            ),
            UIHelper.verticalSpaceMedium,

            _buildHeaderSection(
              leadingText: 'অনুচ্ছেদের বিবরণ',
              trailingText: '১২০ শব্দ',
            ),
            UIHelper.verticalSpaceMedium,

            buildParagraphDescInput(),
            UIHelper.verticalSpaceMedium,

            ActionButton(
              name: 'সংরক্ষন করুন',
              height: 50.h,
              borderRadius: 8.r,
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  dateController.list.add(Datum(
                      name: pTitleController.text,
                      category: pSectionController.text,
                      date: "1720728000",
                      location: pLocationController.text));
                  clearController();
                  showCustomAlertDialog2(context);
                } else {
                  ToastUtil.showLongToast(
                      'অনুগ্রহ করে সকল তথ্য দিয়ে ফর্মটি পূরণ করুন');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Row _buildHeaderSection(
      {required String leadingText, String? trailingText, Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: TextFontStyle.headline16StylenotoSerifBengali700,
        ),
        trailing ??
            (trailingText != null
                ? Text(
                    trailingText,
                    style: TextFontStyle.headline14StylenotoSerifBengali,
                  )
                : SizedBox.shrink()),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          NavigationService.goBack;
        },
        child: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(Assets.svgs.backArrow),
        ),
      ),
      title: Text(
        'নতুন যোগ করুন',
        style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
      ),
    );
  }

  Widget buildParagraphDescInput() {
    return CustomFormField(
      textEditingController: pDescController,
      hintText: 'কার্যক্রমের বিবরণ লিখুন',
      inputType: TextInputType.multiline,
      maxline: 8,
      textInputAction: TextInputAction.done,
      inputFormatters: [LengthLimitingTextInputFormatter(120)],
      onChanged: (value) {
        descCharCount.value = value.length;

        // Warning (Text Character Limit Exceeded)
        if (descCharCount.value == 120) {
          KeyboardUtil.hideKeyboard(context);
          ToastUtil.showShortToast("আপনি ১২০ শব্দের সীমা অতিক্রম করিয়াছেন");
        }
      },
      onFieldSubmitted: (val) {
        KeyboardUtil.hideKeyboard(context);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'অনুগ্রহ করে আপনার কার্যক্রমের বিবরণ লিখুন';
        }
        if (value.length > 120) {
          return '১২০ শব্দের অধিক গ্রহণযোগ্য নহে';
        }
        return null;
      },

      // Colors
      errorBorderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      focusedBorderColor: Colors.transparent,
      disabledBorderColor: Colors.transparent,
      focusedErrorBorderColor: Colors.transparent,
    );
  }

  Widget _buildInputSection(
      {required TextEditingController controller,
      required String hintText,
      String? Function(String?)? validator,
      TextInputAction? textInputAction,
      String? prefixIcon,
      bool isSuffixNeeded = false,
      bool showCorsor = true,
      bool readOnly = false,
      TextInputType inputType = TextInputType.name,
      List<TextInputFormatter>? inputFormatters}) {
    return CustomFormField(
      readOnly: readOnly,
      showCorsor: showCorsor,
      inputFormatters: inputFormatters,
      textEditingController: controller,
      hintText: hintText,
      inputType: inputType,
      textInputAction: textInputAction ?? TextInputAction.next,
      prefixIcon: (prefixIcon != null)
          ? Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(prefixIcon),
            )
          : null,
      suffixIcon: isSuffixNeeded
          ? Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(Assets.svgs.frontArrowIos),
            )
          : SizedBox.shrink(),
      validator: validator,

      // Colors
      errorBorderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      focusedBorderColor: Colors.transparent,
      disabledBorderColor: Colors.transparent,
      focusedErrorBorderColor: Colors.transparent,
    );
  }

  void _pickedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(2000), // the earliest date the user can pick
      lastDate: DateTime(2100), // the latest date the user can pick
    );

    if (pickedDate != null) {
      // Format the picked date as desired
      String formattedDate =
          DateFormat('dd/MM/yyyy hh:mm', 'bn').format(pickedDate);
      // Update the controller value
      selectedDate = formattedDate;
    }
  }

  void clearController() {
    pTitleController.clear();
    pDescController.clear();
    pDatTimeController.clear();
    pLocationController.clear();
    pSectionController.clear();
  }
}
