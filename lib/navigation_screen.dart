import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/features/calender/presentation/calender_screen.dart';
import 'package:flutter_task/features/home/presentation/home_screen.dart';
import 'constants/text_font_style.dart';
import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';
import 'helpers/ui_helpers.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CalenderScreen(),
    const Screen(),
    const Screen(),
  ];

  void onTap(int index) {
    log(_currentIndex.toString());
    setState(() {
      _currentIndex = index;
      log(_currentIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          body: Center(
            child: _screens[_currentIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.sp, // Adjust notch margin as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem(
                  _currentIndex == 0
                      ? Assets.svgs.selectedHome
                      : Assets.svgs.home,
                  0,
                ),
                _buildNavItem(
                    _currentIndex == 1
                        ? Assets.svgs.calendar
                        : Assets.svgs.calenderSelected,
                    1),
                UIHelper.horizontalSpace(40.w),
                _buildNavItem(Assets.svgs.time, 2),
                _buildNavItem(
                  Assets.svgs.profile,
                  3,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: isKeyboardVisible
              ? null
              : Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      end: Alignment(0.85, -0.53),
                      begin: Alignment(-0.85, 0.53),
                      colors: [AppColors.c86B560, AppColors.c336F4A],
                    ),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 18.r,
                        offset: Offset(1, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: SvgPicture.asset(
                      Assets.svgs.camera,
                    ),
                  ),
                )),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UIHelper.verticalSpace(20.h),
          SvgPicture.asset(
            iconPath,
            width: 30.w, // Set a default color for all icons
          ),
          UIHelper.verticalSpace(20.h),
        ],
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Task',
          style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
        ),
      ),
    );
  }
}
