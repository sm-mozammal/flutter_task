import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../controller/date_controler.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/di.dart';

class SelectDayCard extends StatefulWidget {
  const SelectDayCard({
    super.key,
  });

  @override
  State<SelectDayCard> createState() => _SelectDayCardState();
}

class _SelectDayCardState extends State<SelectDayCard> {
  late ScrollController _scrollController;
  final DateController _dateController = locator<DateController>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dateController.setSelectedDate(DateTime.now());
      _scrollToSelectedDate();
    });
    ever(_dateController.selectedDate, (_) => _scrollToSelectedDate());
  }

  @override
  void dispose() {
    _dateController.removeListener(_scrollToSelectedDate);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedDate() {
    final selectedDateIndex =
        _dateController.selectedDate.value.difference(DateTime.now()).inDays +
            7; // Calculate index based on selected date
    final itemCount = 15; // Total items (7 days before + today + 7 days after)

    // Ensure the index is within bounds
    if (selectedDateIndex >= 0 && selectedDateIndex < itemCount) {
      _scrollController.animateTo(
        selectedDateIndex * 35.5, // Assuming each item is 35.5 pixels wide
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 15, // 7 days before + today + 7 days after
            itemBuilder: (context, index) {
              DateTime date =
                  DateTime.now().subtract(Duration(days: 7 - index));
              String dayName =
                  DateFormat('EEE', 'bn').format(date); // Format day in Bengali
              String formattedDate =
                  DateFormat('d', 'bn').format(date); // Format date in Bengali

              return Obx(() {
                // To selecte the date
                bool isSelected = date.day ==
                        _dateController.selectedDate.value.day &&
                    date.month == _dateController.selectedDate.value.month &&
                    date.year == _dateController.selectedDate.value.year;
                return GestureDetector(
                  onTap: () {
                    _dateController.setSelectedDate(date);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                    child: Container(
                      alignment: Alignment.center,
                      width: 45.w,
                      height: 65.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: isSelected
                              ? BorderSide(width: 2.w, color: AppColors.c86B560)
                              : BorderSide(
                                  width: 0.w, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            dayName,
                            textAlign: TextAlign.center,
                            style:
                                TextFontStyle.headline14StylenotoSerifBengali,
                          ),
                          Text(formattedDate,
                              style: TextFontStyle
                                  .headline16StylenotoSerifBengali),
                        ],
                      ),
                    ),
                  ),
                );
              });
            }),
      ),
    );
  }
}
