import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/core/constants/AppConstants.dart';
import 'package:newsapp/ui/view/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Future.delayed(const Duration(milliseconds: 2500));

      if (!context.mounted) return;
      Navigator.pushNamed(context, 'onboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Lottie.asset(AppConstants.LOTTIE),
        ),
      ),
    );
  }
}
