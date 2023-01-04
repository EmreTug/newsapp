import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.isLastPage, this.onPressed}) : super(key: key);
  final String _getStarted = 'Get Started';
  final String _end = 'Next';

  final VoidCallback? onPressed;

  final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xff1877F2))),
      onPressed: onPressed,
      child: Text(isLastPage ? _getStarted : _end,style: const TextStyle(color: Colors.white),),
    );
  }
}