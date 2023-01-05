import 'package:get_it/get_it.dart';
import 'package:newsapp/core/services/auth_service.dart';
import 'package:newsapp/core/services/service.dart';
import 'package:newsapp/ui/view/authenticate/login/viewmodel/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  // locator.registerFactory(() => UserModel);
}
