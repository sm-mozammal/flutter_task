import 'package:flutter/material.dart';
import 'package:flutter_task/welcome_screen.dart';

import 'helpers/helper_methods.dart';
import 'navigation_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = false;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    _isLoading = true;
    Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      // return Container();
      // Need to place screen later...
      return NavigationScreen();
    }
  }
}
