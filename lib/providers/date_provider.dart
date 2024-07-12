import 'package:flutter/foundation.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';

class DateProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  List<Datum> _list = [];

  DateTime get selectedDate => _selectedDate;
  List<Datum> get list => _list;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedList(List<Datum> list) {
    _list = list;
  }

  void addList(Datum data) {
    _list.add(data);
    notifyListeners();
  }
}
