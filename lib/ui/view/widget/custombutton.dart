
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonFullWidth extends StatelessWidget {
  const CustomButtonFullWidth({
    super.key,
    required this.text, this.click,
  });
  final Function()? click;

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: click,
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff1877F2))),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white),
          ),
        ));
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text, this.click, required this.height,
  });
  final Function()? click;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: click,
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff1877F2))),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white),
          ),
        ));
  }
}
