import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../providers/date_provider.dart';

class SelectDayCard extends StatefulWidget {
  const SelectDayCard({
    super.key,
  });

  @override
  State<SelectDayCard> createState() => _SelectDayCardState();
}

class _SelectDayCardState extends State<SelectDayCard> {
  late ScrollController _scrollController;
  late DateProvider _dateProvider;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _dateProvider = Provider.of<DateProvider>(context, listen: false);
    _dateProvider.setSelectedDate(DateTime.now());
    _dateProvider.addListener(_scrollToSelectedDate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDate();
    });
  }

  @override
  void dispose() {
    _dateProvider.removeListener(_scrollToSelectedDate);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedDate() {
    final selectedDateIndex =
        _dateProvider.selectedDate.difference(DateTime.now()).inDays +
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
      child: GestureDetector(
        child: SizedBox(
          height: 80.h,
          child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 15, // 7 days before + today + 7 days after
              itemBuilder: (context, index) {
                DateTime date =
                    DateTime.now().subtract(Duration(days: 7 - index));
                String dayName = DateFormat('EEE', 'bn')
                    .format(date); // Format day in Bengali
                String formattedDate = DateFormat('d', 'bn')
                    .format(date); // Format date in Bengali
                bool isSelected = date.day ==
                        Provider.of<DateProvider>(context).selectedDate.day &&
                    date.month ==
                        Provider.of<DateProvider>(context).selectedDate.month &&
                    date.year ==
                        Provider.of<DateProvider>(context).selectedDate.year;
                return GestureDetector(
                  onTap: () {
                    Provider.of<DateProvider>(context, listen: false)
                        .setSelectedDate(date);
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
                            style: TextFontStyle
                                .headline14StylenotoSerifBengaliTextBold,
                          ),
                          Text(formattedDate,
                              style: TextFontStyle
                                  .headline16StylenotoSerifBengali),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
