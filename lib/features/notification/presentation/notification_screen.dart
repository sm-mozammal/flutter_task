import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/helpers/dateuitl.dart';
import 'package:flutter_task/helpers/di.dart';
import 'package:get/get.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../controller/notification_controller.dart';
import '../../../../gen/colors.gen.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/navigation_service.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController notificationController =
      locator<NotificationController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notificationController.markNotificationsAsRead();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController =
        Get.put(locator.get<NotificationController>());

    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: notificationController.notifications.length,
            itemBuilder: (context, index) {
              final notification =
                  notificationController.notifications[index].split('\n');
              final title = notification[1].split(': ')[1];
              final category = notification[2].split(': ')[1];
              final date = notification[3].split(': ')[1];
              final location = notification[4].split(': ')[1];
              final description = notification[5].split(': ')[1];

              return Card(
                margin: EdgeInsets.all(10.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 6,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                  leading: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.c336F4A,
                    child: Icon(Icons.notifications,
                        color: AppColors.cF4F5F7, size: 30.sp),
                  ),
                  title: Text(
                    title,
                    style: TextFontStyle.headline20StylenotoSerifBengaliTextBold
                        .copyWith(
                      color: AppColors.c336F4A,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category: $category',
                        style: TextFontStyle.headline14StylenotoSerifBengali
                            .copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Date: ${DateFormatedUtils.formatDate(date)}',
                        style: TextFontStyle.headline14StylenotoSerifBengali
                            .copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Location: $location',
                        style: TextFontStyle.headline14StylenotoSerifBengali
                            .copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Description: $description',
                        style: TextFontStyle.headline14StylenotoSerifBengali
                            .copyWith(
                          color: Colors.black54,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete,
                        color: AppColors.cFF5252, size: 28.sp),
                    onPressed: () {
                      notificationController.removeNotification(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
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
        'বিজ্ঞপ্তি',
        style: TextFontStyle.headline16StylenotoSerifBengaliTextBold,
      ),
    );
  }
}
