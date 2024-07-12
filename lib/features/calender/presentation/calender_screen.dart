import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/common_widgets/action_button.dart';
import 'package:flutter_task/common_widgets/custom_container.dart';
import 'package:flutter_task/helpers/dateuitl.dart';
import 'package:flutter_task/helpers/ui_helpers.dart';
import 'package:flutter_task/networks/api_acess.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/text_font_style.dart';
import '../../../controller/date_controler.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/di.dart';
import '../../../helpers/navigation_service.dart';
import 'widgets/activity_card.dart';
import 'widgets/selected_day_card.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  // final DateController dateController = Get.find<DateController>();
  // final DateController dateController = Get.put(DateController());

  final DateController dateController = locator<DateController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        height: 600,
        child: ListView(
          padding: EdgeInsets.all(24.sp),
          children: [
            // Display the Heading Section
            _buildHeaderSection(),
            UIHelper.verticalSpaceMedium,

            // Display the previus 7 days and after 7 days form tow days
            SelectDayCard(),
            UIHelper.verticalSpaceMedium,

            // Displaying Todays Activites
            CustomContainer(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'আজকের কার্যক্রম',
                    style: TextFontStyle.headline16StylenotoSerifBengali700,
                  ),
                  UIHelper.verticalSpaceMedium,
                  StreamBuilder(
                      stream: getDataRX.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show circular progress when connectionstate is wating
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else if (snapshot.hasData && snapshot.data != null) {
                          final data = snapshot.data!;

                          dateController.setSelectedList(data.data ?? []);
                          if (data.data!.isEmpty) {
                            // Show when the data is empty
                            return Center(
                              child: Text(
                                'কোন কার্যক্রম পাওয়া যায়নি',
                                style: TextFontStyle
                                    .headline16StylenotoSerifBengali700,
                              ),
                            );
                          } else {
                            return Obx(() {
                              // Filter List By Date
                              final filterData = dateController.list
                                  .where(
                                    (element) =>
                                        DateFormatedUtils.formatDate(
                                            element.date!) ==
                                        DateFormatedUtils.formatDateTime(
                                            dateController.selectedDate.value),
                                  )
                                  .toList();
                              log('filterData: ${filterData.toList()}');
                              log('dataController: ${dateController.list}');
                              if (filterData.isEmpty) {
                                // show when the filterData is empty
                                return Center(
                                  child: Text(
                                    'কোন কার্যক্রম পাওয়া যায়নি',
                                    style: TextFontStyle
                                        .headline16StylenotoSerifBengali700,
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: filterData.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: ActivityCard(
                                        index: index,
                                        data: filterData[index],
                                      ),
                                    );
                                  },
                                );
                              }
                            });
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                ],
              ),
            ),
          ],
        ),
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

        // Navigate to Add New Activitics Screen
        ActionButton(
          onTap: () {
            NavigationService.navigateTo(Routes.addNewActivities);
          },
          name: 'নতুন যোগ করুন',
          width: 110.w,
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
                child: SvgPicture.asset(Assets.svgs.notificationBadge),
              )),
        ),
      ],
    );
  }
}
