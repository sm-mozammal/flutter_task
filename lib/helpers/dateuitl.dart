// ignore_for_file: unnecessary_new, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:intl/intl.dart';

final class DateFormatedUtils {
  static String formatDate(String timestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    return DateFormat('yyyy-MM-dd', 'bn').format(dateTime);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('yyyy-MM-dd', 'bn').format(date);
  }

  static String stringTime(String timestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    return DateFormat('hh:mm', 'bn').format(dateTime);
  }

  static String formatTime(String timestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd', 'bn').format(dateTime);
    String formattedTime = DateFormat('hh:mm a', 'bn').format(dateTime);

    log('formattedTime * : $formattedTime\n');
    String? amIs;

    // // Customizing the time part
    // if (formattedTime.contains('AM')) {
    //   formattedTime = formattedTime.replaceAll('AM', '');
    //   amIs = 'সকাল';
    // } else if (formattedTime.contains('PM')) {
    //   formattedTime = formattedTime.replaceAll('PM', '');
    //   amIs = 'বিকাল';
    // }

    // Customizing the time part
    int hour = dateTime.hour;
    if (hour >= 4 && hour < 12) {
      formattedTime = formattedTime.replaceAll('AM', '');
      amIs = 'সকাল';
    } else if (hour >= 12 && hour < 16) {
      formattedTime = formattedTime.replaceAll('PM', '');
      amIs = 'দুপুর';
    } else if (hour >= 16 && hour < 20) {
      formattedTime = formattedTime.replaceAll('PM', '');
      amIs = 'বিকাল';
    } else {
      formattedTime = formattedTime.replaceAll('AM', '');
      formattedTime = formattedTime.replaceAll('PM', '');
      amIs = 'বিকাল';
    }

    // formattedTime = formattedTime.replaceAll(':', ' মি.');
    return '$amIs\n$formattedTime মি.';
  }
}
