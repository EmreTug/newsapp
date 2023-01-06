import 'package:newsapp/core/services/auth_service.dart';

import '../../../../../core/enum/viewstate.dart';
import '../../../../../core/viewmodel/base_model.dart';
import '../../../../../locator.dart';

class RegisterModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  late String errorMessage;

  Future<bool> register(String email, String password) async {
    setState(ViewState.Busy);

    if (email.isEmpty) {
      errorMessage = 'Email adresinizi giriniz';
      setState(ViewState.Idle);
      return false;
    } else if (password.isEmpty) {
      errorMessage = 'Şifrenizi giriniz';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.register(email,password);


    setState(ViewState.Idle);
    return success;
  }
}