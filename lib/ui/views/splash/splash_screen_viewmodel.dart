import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ozcoffee/ui/views/home/home_view.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future<void> handleStartupLogic(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }
}
