import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/FontConstants.dart';
import 'package:newsapp/ui/shared/padding/padding.dart';
import 'package:newsapp/ui/view/authenticate/onboard/component/NextButton.dart';
import 'package:newsapp/ui/view/authenticate/onboard/component/tabIndicator.dart';
import 'package:newsapp/ui/view/authenticate/onboard/model/onboard_model.dart';

import '../../../base_view.dart';
import '../component/BackButton.dart';
import '../viewmodel/onboardviewmodel.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
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

 
  @override
  Widget build(BuildContext context) {

    return BaseView<OnBoardViewModel>(builder: (context, model, child) {
  return Scaffold(
      body: Column(
        children: [
          _buildPageView(model),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: TabIndicator(selectedIndex: model.selectedIndex),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    OnBoardBackButton(
                      isFirstPage: model.isFirstPage,
                      onPressed: () {
                        model.previousPage(_pageController);
                      },
                    ),
                    NextButton(
                      isLastPage: model.isLastPage,
                      onPressed: () {
                        if (model.isLastPage) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "detail",
                            (route) => false,
                          );
                        } else {
                          model.nextPage(_pageController);
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
    });
  }

  Widget _buildPageView(OnBoardViewModel model) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          model.incrementAndChange(value);
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
