import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/common_widgets/action_button.dart';
import 'package:flutter_task/helpers/ui_helpers.dart';
import 'package:intl/intl.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/selected_day_card.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.all(24.sp),
        children: [
          // Display the Heading Section
          _buildHeaderSection(),
          UIHelper.verticalSpaceMedium,

          // Display the previus 7 days and after 7 days form tow days
          SelectDayCard(),

          // Displaying Todays Activites
        ],
      ),
    );
  }

  Row _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'আজ, ${DateFormat('d MMMM', 'bn').format(DateTime.now())}',
          style: TextFontStyle.headline16StylenotoSerifBengali700,
        ),
        ActionButton(
          name: 'নতুন যোগ করুন',
          width: 100.w,
          height: 30.h,
          borderRadius: 18.r,
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: SvgPicture.asset(
          Assets.svgs.hamburgerMenu,
        ),
      ),
      title: Text(
        'সময়রেখা',
        style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Container(
              width: 35.h,
              height: 35.w,
              decoration: ShapeDecoration(
                color: Color(0xFFF4F5F6),
                shape: CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: SvgPicture.asset(Assets.svgs.bell),
              )),
        ),
      ],
    );
  }
}
