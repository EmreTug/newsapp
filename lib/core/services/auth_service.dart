import 'dart:async';
import 'package:newsapp/core/model/user.dart';

import '../../locator.dart';
import 'API.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  StreamController<UserModel> userController = StreamController<UserModel>();

  Future<bool> login(String email, String password) async {
    var fetchedUser = await _api.getUser(email, password);

    var hasUser = (fetchedUser != null) ? true : false;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }

  Future<bool> register(String email, String password) async {
    var fetchedUser = await _api.createUser(email, password);

    var hasUser = (fetchedUser != null) ? true : false;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }

  Future<bool> googleLogin() async {
    var fetchedUser = await _api.signInWithGoogle();

    var hasUser = (fetchedUser != null) ? true : false;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }

  Future<bool> sendpasswordresetmail(String email) async {
    try {
      await _api.sendpasswordresetmail(email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
