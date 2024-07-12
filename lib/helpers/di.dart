import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/date_controler.dart';

final locator = GetIt.instance;
final appData = locator.get<GetStorage>();

void diSetup() {
  locator.registerSingleton<GetStorage>(GetStorage());
  locator.registerLazySingleton<DateController>(() => DateController());
}
