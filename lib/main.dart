import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/gen/colors.gen.dart';
import 'package:flutter_task/navigation_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/keyboard.dart';
import 'helpers/navigation_service.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  initiInternetChecker();
  DioSingleton.instance.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    KeyboardUtil.hideKeyboard(context);
    return
        //  MultiProvider(
        //   providers: providers,
        // child:
        PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const UtillScreenMobile();
        },
      ),
    );
    // );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kaam Services',
            theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: AppColors.cFFFFFF),
              scaffoldBackgroundColor: AppColors.cFEFFFE,
              primaryColor: AppColors.c000000,
              useMaterial3: false,
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor:
                    AppColors.c000000, // Set your custom cursor color here
              ),
              // unselectedWidgetColor: AppColors
              //     .c22252D, // All unchecked widget's including checkbox color
            ),
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: NavigationScreen(),
          ),
        );
      },
    );
  }
}
