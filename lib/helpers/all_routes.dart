import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_task/features/calender/presentation/calender_screen.dart';

import '../features/calender/presentation/add_new_activities_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/notification/presentation/notification_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String splash = '/splash';
  static const String home = '/home';
  static const String calender = '/calender';
  static const String addNewActivities = '/add_new_activities';
  static const String notification = '/notification';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: HomeScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const HomeScreen());
      case Routes.calender:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: CalenderScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const CalenderScreen());
      case Routes.addNewActivities:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: AddNewActivitiesScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const AddNewActivitiesScreen());
      case Routes.notification:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(widget: NotificationScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => NotificationScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
