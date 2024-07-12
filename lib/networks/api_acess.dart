import 'package:flutter_task/features/calender/data/rx_get_data/rx.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';
import 'package:rxdart/rxdart.dart';

GetDataRX getDataRX = GetDataRX(
    empty: ResponseData(), dataFetcher: BehaviorSubject<ResponseData>());
