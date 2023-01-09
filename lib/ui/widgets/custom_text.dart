

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.weight,
    this.color, this.maxLines,
  });
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color? color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: weight, color: color),
    );
  }
}
