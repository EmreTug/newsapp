import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/view/base_view.dart';
import 'package:newsapp/ui/view/home/selectnewssource/viewmodel/selectnewssourceviewmodel.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';

class SelectNewsSource extends StatefulWidget {
  const SelectNewsSource({super.key});

  @override
  State<SelectNewsSource> createState() => _SelectNewsSourceState();
}

class _SelectNewsSourceState extends State<SelectNewsSource> {
  @override
  Widget build(BuildContext context) {
 
    return BaseView<SelectNewsSourceModel>(builder: (context, model, child) {
      return   Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose your News Sources",
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
                    spacing: 22,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: model.myProducts.map((e) {
                      return GestureDetector(
                        onTap: () {
                         model.setSelected(e["id"]);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            height: 158,
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xffFAFAFA),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  height: 84,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEEF1F4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage:
                                        AssetImage("assets/images/ob_1.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "CNBC",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: e["isSelected"]
                                          ? const Color(0xff1877F2)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xff1877F2))),
                                  child: Center(
                                    child: Text(
                                      e["isSelected"]?"Following":"Follow",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: e["isSelected"]
                                          ? Colors.white
                                          :const Color(0xff1877F2),
                                    ),
                                  ),
                                ),
                            ),],
                            )),
                      );
                    }).toList()),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: UIHelper.HorizontalSpaceSmall),
              child: customButton(
                text: "Next",
                click: () {
                  Navigator.pushNamed(context, "fillprofile");
                },
              ),
            )
          ],
        ),
      ),
    );
 
    });
   }
}
