import 'package:flutter/material.dart';

import '../../../../../core/enum/viewstate.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/viewmodel/base_model.dart';
import '../../../../../locator.dart';
import '../../../widget/radioitem.dart';

class ForgotPasswordModel extends BaseModel {
    final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  List<RadioModel> sampleData = [
    RadioModel(
        false, Icons.email_outlined, 'via Email:', 'example@youremail.com'),
    RadioModel(false, Icons.sms_outlined, 'via SMS:', '05555555555')
  ];

  void changeisSelected(int index) {
    for (var element in sampleData) {
      element.isSelected = false;
    }
    sampleData[index].isSelected = true;
    notifyListeners();
  }
  Future<bool> forgotPassword(String email) async {
    setState(ViewState.Busy);
    var success = await _authenticationService.sendpasswordresetmail(email);
    setState(ViewState.Idle);
    return success;
  }

}
