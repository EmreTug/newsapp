import 'package:flutter/material.dart';
import 'package:newsapp/core/services/auth_service.dart';

import '../../../../../core/enum/viewstate.dart';
import '../../../../../core/viewmodel/base_model.dart';
import '../../../../../locator.dart';
import '../model/onboard_model.dart';

class OnBoardViewModel extends BaseModel {
    int selectedIndex = 0;

  bool get isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == selectedIndex;

  bool get isFirstPage => selectedIndex == 0;


 ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  void incrementAndChange([int? value]) {
    if (isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }

    _changeBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
    notifyListeners();
  }

  void _incrementSelectedPage([int? value]) {
    
      if (value != null) {
        selectedIndex = value;
      } else {
        selectedIndex++;
      }
    notifyListeners();

    
  }

  void previousPage(PageController _pageController) {
    _pageController.animateToPage(_pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    notifyListeners();

  }

  void nextPage(PageController _pageController) {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    notifyListeners();

  }




}
