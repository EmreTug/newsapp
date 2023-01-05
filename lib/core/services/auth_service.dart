import 'dart:async';
import 'package:newsapp/core/model/user.dart';

import '../../locator.dart';
import 'service.dart';

class AuthenticationService {
  final Api _api = locator<Api>();

  StreamController<UserModel> userController = StreamController<UserModel>();

  Future<bool> login(String email,String password) async {
    var fetchedUser = await _api.getUser(email,password);

    var hasUser = (fetchedUser != null)?true:false;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}