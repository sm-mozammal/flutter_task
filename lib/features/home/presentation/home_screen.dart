import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/common_widgets/drawer.dart';
import 'package:flutter_task/constants/app_constants.dart';
import 'package:flutter_task/constants/text_font_style.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/gen/colors.gen.dart';
import 'package:flutter_task/helpers/ui_helpers.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'widges/count_container.dart';
import 'widges/menu_card.dart';
import 'widges/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: unused_field
  bool _navigationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      onDrawerChanged: (isOpened) => setState(() {
        isOpened = !isOpened;
      }),
      // Home Screen AppBar
      appBar: _buildAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display Profile Information (Show Image , Name , Company Name , Location)
              ProfileCard(),
              UIHelper.verticalSpaceMedium,
              Row(
                children: [
                  // Show time indication
                  _buildProgressIndication(),
                  UIHelper.horizontalSpaceSmall,
                  // Show the ExpireDate & Date Count
                  _buildExpireDate()
                ],
              ),
              UIHelper.verticalSpaceMedium,
              // Show the Menu
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 20.w, // Spacing between columns
                    mainAxisSpacing: 24.h, // Spacing between rows
                  ),
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return MenuCared(
                      image: menu[index]['image'],
                      menu: menu[index]['title'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildExpireDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'মেয়াদকাল',
          style: TextFontStyle.headline16StylenotoSerifBengali700,
        ),
        Row(
          children: [
            SvgPicture.asset(
              Assets.svgs.calenderSelected,
              height: 14.h,
            ),
            UIHelper.horizontalSpace6,
            Text(
              '১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',
              style: TextFontStyle.headline12StylenotoSerifBengali500,
            ),
          ],
        ),
        UIHelper.verticalSpace(12.h),
        Text(
          'আরও বাকি',
          style: TextFontStyle.headline16StylenotoSerifBengali700cFF737A,
        ),
        UIHelper.verticalSpace4,
        Row(
          children: [
            _buildDateCount('বছর', '৫', '০'),
            UIHelper.horizontalSpaceSmall,
            _buildDateCount('মাস', '৬', '০'),
            UIHelper.horizontalSpaceSmall,
            _buildDateCount('দিন', '২', '১'),
          ],
        ),
      ],
    );
  }

  Column _buildDateCount(String? title, String? sDigite, String? fDigite) {
    return Column(
      children: [
        Row(
          children: [
            CountContainer(text: fDigite),
            UIHelper.horizontalSpace(4.w),
            CountContainer(text: sDigite),
          ],
        ),
        UIHelper.verticalSpace4,
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextFontStyle.headline12StylenotoSerifBengali500,
        ),
      ],
    );
  }

  Column _buildProgressIndication() {
    return Column(
      children: [
        Container(
          child: CircularPercentIndicator(
            backgroundWidth: 10.w,
            backgroundColor: AppColors.cF5F5F5,
            radius: 55.r,
            progressColor: AppColors.c336F4A,
            percent: 0.06,
            startAngle: 180,
            animateFromLastPercent: true,
            animation: true,
            center: Text(
              '৬ মাস ৬ দিন ',
              style: TextFontStyle.headline14StylenotoSerifBengali600,
            ),
          ),
        ),
        UIHelper.verticalSpace(8.h),
        Text(
          'সময় অতিবাহিত',
          style: TextFontStyle.headline16StylenotoSerifBengali700,
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: GestureDetector(
          onTap: () {
            log('click');
            _scaffoldKey.currentState?.openDrawer();
          },
          child: SvgPicture.asset(
            Assets.svgs.hamburgerMenu,
          ),
        ),
      ),
      title: Row(
        children: [
          Image.asset(
            Assets.icons.demo.path,
            height: 37.h,
            width: 37.w,
          ),
          UIHelper.horizontalSpaceSmall,
          Text(
            'Flutter Task',
            style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: SvgPicture.asset(Assets.svgs.notificationBadge),
        ),
      ],
    );
  }
}
