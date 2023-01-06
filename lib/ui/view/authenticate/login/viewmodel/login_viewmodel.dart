import 'package:newsapp/core/services/auth_service.dart';

import '../../../../../core/enum/viewstate.dart';
import '../../../../../core/viewmodel/base_model.dart';
import '../../../../../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  void changeErrorMessage(String message) {
    errorMessage = message;
    notifyListeners();
  }
   void changeCheckBox() {
    check=!check;
    notifyListeners();
  }
   void changePasswordVisible() {
    passwordVisible=!passwordVisible;
    notifyListeners();
  }

  String errorMessage = "";
  bool check = false;
  bool passwordVisible= false;

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);

    if (email.isEmpty) {
      changeErrorMessage('Email adresinizi giriniz');
      setState(ViewState.Idle);
      return false;
    } else if (password.isEmpty) {
      changeErrorMessage('Şifrenizi giriniz');
      setState(ViewState.Idle);
      return false;
    }

    try {
      var success = await _authenticationService.login(email, password);
      setState(ViewState.Idle);
      if (success == false) {
        changeErrorMessage('Kullanıcı adı veya şifre hatalı');
      } else {
        changeErrorMessage('');
      }
      return success;
    } catch (e) {
      setState(ViewState.Idle);
      changeErrorMessage('Kullanıcı adı veya şifre hatalı');

      return false;
    }
  }

  Future<bool> googleLogin() async {
    setState(ViewState.Busy);
    var success = await _authenticationService.googleLogin();
    setState(ViewState.Idle);
    return success;
  }
}
