import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/ui_helpers.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback? hOnTap;
  final VoidCallback? aOnTap;
  final VoidCallback? wOnTap;
  final VoidCallback? pOnTap;
  const AppDrawer(
      {super.key, this.hOnTap, this.aOnTap, this.wOnTap, this.pOnTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 22.h, //Utils.scrHeight * 0.022,
            vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80.h,
            ),
            // App Logo
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icons.demo.path,
                  height: 50,
                ),
                UIHelper.horizontalSpaceSmall,
                Text(
                  'Flutter Task',
                  style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
                ),
              ],
            )),
            SizedBox(
              height: 50.h,
            ),

            DrawerItems(
                image: Assets.svgs.home,
                onTap: () {
                  if (hOnTap == null) {
                    return;
                  } else {
                    hOnTap;
                  }
                },
                title: 'হোম'),
            SizedBox(
              height: 16.h,
            ),
            DrawerItems(
                image: Assets.svgs.calenderSelected,
                onTap: () {
                  if (hOnTap == null) {
                    return;
                  } else {
                    hOnTap;
                  }
                },
                title: 'সময়রেখা'),
            SizedBox(
              height: 16.h,
            ),
            DrawerItems(
                image: Assets.svgs.time,
                onTap: () {
                  if (hOnTap == null) {
                    return;
                  } else {
                    hOnTap;
                  }
                },
                title: 'সময়রেখা'),
            SizedBox(
              height: 16.h,
            ),
            DrawerItems(
                image: Assets.svgs.profile,
                onTap: () {
                  if (hOnTap == null) {
                    return;
                  } else {
                    hOnTap;
                  }
                },
                title: 'প্রোফাইল'),
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems(
      {super.key,
      required this.image,
      required this.onTap,
      required this.title});

  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0.h),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 33.h,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(
              title,
              style: TextFontStyle.headline14StylenotoSerifBengali,
            ),
          ],
        ),
      ),
    );
  }
}
