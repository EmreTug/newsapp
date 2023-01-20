import 'package:newsapp/core/services/auth_service.dart';

import '../../../../../core/viewmodel/base_model.dart';
import '../../../../../locator.dart';

class SplashModel extends BaseModel{
 final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
      bool fetchUser(){
       return _authenticationService.getUser();
      }
}