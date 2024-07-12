import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';

class DateController extends GetxController {
  var selectedDate = DateTime.now().obs;
  // List<Datum> list = <Datum>[].obs;
  var list = <Datum>[].obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void setSelectedList(List<Datum> newList) {
    list.assignAll(newList);
  }

  void addToList(Datum data) {
    log('Datum data Adding name: ${data.name}');
    list.add(data);
  }
}
