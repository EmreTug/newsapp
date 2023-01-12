import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
            left: UIHelper.VerticalSpaceMedium,
            right: UIHelper.VerticalSpaceMedium,
            bottom: UIHelper.HorizontalSpaceMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Text(
                  "Congratulations!",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: const Color(0xff4E4B66)),
                ),
                Text(
                  "Your account is ready to use",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xff4E4B66)),
                ),
              ],
            ),
              CustomButtonFullWidth(text: "Go To Login",click: () {
                Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
              },)
          ],
        ),
      ),
    );
  }
}
