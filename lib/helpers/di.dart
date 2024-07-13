import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/auth_controller.dart';
import '../controller/date_controler.dart';
import '../controller/notification_controller.dart';

final locator = GetIt.instance;
final appData = locator.get<GetStorage>();

void diSetup() {
  locator.registerSingleton<GetStorage>(GetStorage());
  locator.registerLazySingleton<DateController>(() => DateController());

  locator.registerLazySingleton<NotificationController>(
      () => NotificationController());
  locator.registerLazySingleton<AuthController>(() => AuthController());
}
