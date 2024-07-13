import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var selectedDate = DateTime.now().obs;
  // List<Datum> list = <Datum>[].obs;
  var list = <Datum>[].obs;

  var pickedDate =
      DateFormat('dd/MM/yyyy hh:mm', 'bn').format(DateTime.now()).obs;

  var timeStamp = ''.obs;

  void setPckedDate(String pick) {
    pickedDate.value = pick;
  }

  void setTimeStamp(String time) {
    timeStamp.value = time;
  }

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
