import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/authenticate/forgotpassword/view/forgot_password_mail.dart';
import 'package:newsapp/ui/view/authenticate/forgotpassword/view/forgot_password_view.dart';
import 'package:newsapp/ui/view/authenticate/forgotpassword/view/success.dart';
import 'package:newsapp/ui/view/authenticate/login/view/login_view.dart';
import 'package:newsapp/ui/view/authenticate/onboard/view/onboard_view.dart';
import 'package:newsapp/ui/view/authenticate/register/view/register_view.dart';
import 'package:newsapp/ui/view/bottom_navigation_bar.dart';
import 'package:newsapp/ui/view/home/profile/fillprofile/view/fillprofile_view.dart';
import 'package:newsapp/ui/view/home/home_view.dart';
import 'package:newsapp/ui/view/authenticate/splash/splash_view.dart';
import 'package:newsapp/ui/view/home/profile/selectnewssource/view/selectnewssource.dart';
import 'package:newsapp/ui/view/home/profile/selecttopics/view/selecttopics.dart';

const String initialRoute = "splash";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'bottomnavigationbar':
      return MaterialPageRoute(builder: (_)=>const CustomBottomNavigationBar());
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
      case 'forgotpassword':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case 'forgotpasswordmail':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordMail());
      case 'success':
        return MaterialPageRoute(builder: (_) => const SuccessView());
      case 'selecttopics':
        return MaterialPageRoute(builder: (_) => const SelectTopics());
      case 'selectnewssource':
        return MaterialPageRoute(builder: (_) => const SelectNewsSource());
      case 'fillprofile':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'addnews':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'authorprofile':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'bookmark':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'comment':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'detail':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'explore':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'notification':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'profile':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'editprofile':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'settings':
        return MaterialPageRoute(builder: (_) => const FillProfile());
      case 'trading':
        return MaterialPageRoute(builder: (_) => const FillProfile());
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
