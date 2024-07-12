import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task/features/calender/model/response_data.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetDataApi {
  static final GetDataApi _singleton = GetDataApi._internal();
  GetDataApi._internal();

  static GetDataApi get instance => _singleton;

  Future<ResponseData> fetchData() async {
    try {
      Response response = await getHttp(
        Endpoints.apiUrl(),
      );
      if (response.statusCode == 200) {
        ResponseData data =
            ResponseData.fromRawJson(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
