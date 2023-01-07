import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/FontConstants.dart';
import 'package:newsapp/ui/shared/padding/padding.dart';
import 'package:newsapp/ui/view/authenticate/onboard/component/NextButton.dart';
import 'package:newsapp/ui/view/authenticate/onboard/component/tabIndicator.dart';
import 'package:newsapp/ui/view/authenticate/onboard/model/onboard_model.dart';

import '../component/BackButton.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int _selectedIndex = 0;

  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;

  bool get _isFirstPage => _selectedIndex == 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }

    _changeBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildPageView(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: TabIndicator(selectedIndex: _selectedIndex),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    OnBoardBackButton(
                      isFirstPage: _isFirstPage,
                      onPressed: () {
                        previousPage();
                      },
                    ),
                    NextButton(
                      isLastPage: _isLastPage,
                      onPressed: () {
                        if (_isLastPage) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "selecttopics",
                            (route) => false,
                          );
                        } else {
                          nextPage();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          _incrementAndChange(value);
        },
        itemCount: OnBoardModels.onBoardItems.length,
        itemBuilder: (context, index) {
          return OnBoardCard(
            model: OnBoardModels.onBoardItems[index],
          );
        },
      ),
    );
  }
}

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({
    super.key,
    required this.model,
  });
  final OnBoardModel model;
  @override
  Widget build(BuildContext context) {
    double maxwidth = MediaQuery.of(context).size.width;
    // double maxheight = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(
          model.imageWithPath,
          width: maxwidth,
        ),
        Padding(
          padding: AppPadding.textPadding,
          child: Text(
            model.title,
            style: FontConstants.title,
          ),
        ),
        Padding(
          padding: AppPadding.textPadding,
          child: Text(
            model.description,
            style: FontConstants.description,
          ),
        )
      ],
    );
  }
}
