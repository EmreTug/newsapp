import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/core/constants/AppConstants.dart';
import 'package:newsapp/core/services/auth_service.dart';
import 'package:newsapp/ui/view/authenticate/splash/viewmodel/splash_viewmodel.dart';

import '../../base_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    var _authenticationService = AuthenticationService();

    Future.microtask(() async {
      await Future.delayed(const Duration(milliseconds: 2500));
      if (_authenticationService.getUser()) {
        if (!context.mounted) return;
        Navigator.pushNamed(context, 'bottomnavigationbar');
      }
      else{
        if (!context.mounted) return;
      Navigator.pushNamed(context, 'login');
      }
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
