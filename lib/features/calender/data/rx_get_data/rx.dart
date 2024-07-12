import 'package:flutter_task/features/calender/model/response_data.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetDataRX extends RxResponseInt<ResponseData> {
  final api = GetDataApi.instance;

  GetDataRX({required super.empty, required super.dataFetcher});

  ValueStream get getData => dataFetcher.stream;

  Future<ResponseData> fetchData() async {
    try {
      ResponseData data = await api.fetchData();
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  // @override
  // handleSuccessWithReturn(dynamic data) async {
  //   try {
  //     MyProfileResponse myProfileResponse = data;
  //     // ToastUtil.showShortToast(loginResponse.message!);
  //     // await appData.write(kKeyIsLoggedIn, true);
  //     // await appData.write(kKeyIsExploring, false);
  //     // await appData.write(kKeyUserID, loginResponse.data!.id);
  //     // await appData.write(kKeyAccessToken, loginResponse.token);
  //     dataFetcher.sink.add(myProfileResponse);
  //     return myProfileResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
