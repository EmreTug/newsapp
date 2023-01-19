import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/ColorConstants.dart';

class OnBoardBackButton extends StatelessWidget {
  const OnBoardBackButton({Key? key, required this.isFirstPage, this.onPressed}) : super(key: key);
  final String _getStarted = 'Back';

  final VoidCallback? onPressed;

  final bool isFirstPage;
  @override
  Widget build(BuildContext context) {
    return !isFirstPage? TextButton(
      onPressed: onPressed,
      child: Text(_getStarted,style: const TextStyle(color:  Color(0xffB0B3B8)),),):const SizedBox();
  }
}