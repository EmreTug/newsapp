import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [Icon(Icons.more_vert_outlined, color: Colors.black)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIHelper.HorizontalSpaceSmall),
            child: Container(
              height: 183,
              color: const Color(0xffEEF1F4),
              child: DottedBorder(
                dashPattern: const [10, 5],
                color: const Color(0xff4E4B66),
                strokeWidth: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Color(0xff4E4B66),
                      ),
                      CustomText(
                          text: "Add Cover Photo",
                          fontSize: 14,
                          weight: FontWeight.w400,
                          color: Color(0xff4E4B66))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: UIHelper.HorizontalSpaceSmall),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "News title",
                  hintStyle: GoogleFonts.poppins(
                      color: const Color(0xffA0A3BD),
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: UIHelper.HorizontalSpaceSmall),
                child: TextField(
                  maxLines: 99,
                  decoration: InputDecoration(
                      hintText: "Add News/Article",
                      hintStyle: GoogleFonts.poppins(
                          color: const Color(0xffA0A3BD),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  offset: Offset(3.0, 0),
                ),
              ],
            ),
            height: 80,
            child: const Align(
              alignment: Alignment.centerRight,
              child: CustomButton(text: "Publish", height: 50),
            ),
          )
        ],
      ),
    );
  }
}
