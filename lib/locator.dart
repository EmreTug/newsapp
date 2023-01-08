import 'package:get_it/get_it.dart';
import 'package:newsapp/core/services/auth_service.dart';
import 'package:newsapp/core/services/API.dart';
import 'package:newsapp/ui/view/authenticate/forgotpassword/viewmodel/forgotpassword_viewmodel.dart';
import 'package:newsapp/ui/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:newsapp/ui/view/authenticate/onboard/viewmodel/onboardviewmodel.dart';
import 'package:newsapp/ui/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:newsapp/ui/view/home/selectnewssource/viewmodel/selectnewssourceviewmodel.dart';
import 'package:newsapp/ui/view/home/selecttopics/viewmodel/selecttopicsviewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RegisterModel());
  locator.registerFactory(() => ForgotPasswordModel());
  locator.registerFactory(() => OnBoardViewModel());
  locator.registerFactory(() => SelectTopicsModel());
  locator.registerFactory(() => SelectNewsSourceModel());


}
