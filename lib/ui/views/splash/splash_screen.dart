import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_screen_viewModel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (viewModel) => viewModel.handleStartupLogic(context),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 237, 203),
        body: Center(
          child: Image.asset(
            'assets/Logo.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
