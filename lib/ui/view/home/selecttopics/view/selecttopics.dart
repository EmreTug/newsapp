import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';
import '../../../base_view.dart';
import '../viewmodel/selecttopicsviewmodel.dart';

class SelectTopics extends StatefulWidget {
  const SelectTopics({super.key});

  @override
  State<SelectTopics> createState() => _SelectTopicsState();
}

class _SelectTopicsState extends State<SelectTopics> {
  @override
  Widget build(BuildContext context) {
  
    return BaseView<SelectTopicsModel>(builder: (context, model, child) {
      return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose your Topics",
          style: TextStyle(color: Colors.black),
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: UIHelper.VerticalSpaceMedium,
            right: UIHelper.VerticalSpaceMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: model.myProducts.map((e) {
                      return GestureDetector(
                        onTap: () {
                         model.setSelected(e["id"]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: e["isSelected"]
                                    ? const Color(0xff1877F2)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 1, color: const Color(0xff1877F2))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 13),
                              child: Text(
                                e["name"],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: e["isSelected"]
                                      ? Colors.white
                                      : const Color(0xff1877F2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                top: UIHelper.HorizontalSpaceSmall,
                bottom: UIHelper.HorizontalSpaceSmall),
              child: customButton(text: "Next",click: () {
                Navigator.pushNamed(context, "selectnewssource");
              },),
            )
          ],
        ),
      ),
    );
 
    });
    }
}
