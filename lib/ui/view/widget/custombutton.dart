
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customButton extends StatelessWidget {
  const customButton({
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
