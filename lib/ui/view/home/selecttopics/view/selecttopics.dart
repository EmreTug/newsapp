import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';

class SelectTopics extends StatefulWidget {
  const SelectTopics({super.key});

  @override
  State<SelectTopics> createState() => _SelectTopicsState();
}

class _SelectTopicsState extends State<SelectTopics> {
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = [
      {"id": 0, "name": "National", "isSelected": false},
      {"id": 1, "name": "InterNational", "isSelected": false},
      {"id": 2, "name": "Spor", "isSelected": false},
      {"id": 3, "name": "Health", "isSelected": false},
      {"id": 4, "name": "Health", "isSelected": false},


    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose your Topics",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
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
                    children: myProducts.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            e["isSelected"] = !e["isSelected"];
                          });
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
  }
}
