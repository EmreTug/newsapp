import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/authenticate/login/view/login_view.dart';
import 'package:newsapp/ui/view/authenticate/onboard/view/onboard_view.dart';
import 'package:newsapp/ui/view/authenticate/register/view/register_view.dart';
import 'package:newsapp/ui/view/home/home_view.dart';
import 'package:newsapp/ui/view/authenticate/splash/splash_view.dart';

const String initialRoute = "splash";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case 'splash':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case 'onboard':
        return MaterialPageRoute(builder: (_) => const OnBoardView());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case 'register':
        return MaterialPageRoute(builder: (_) => const RegisterView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
