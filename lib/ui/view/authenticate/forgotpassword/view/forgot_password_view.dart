import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';
import '../../../base_view.dart';
import '../../../widget/radioitem.dart';
import '../viewmodel/forgotpassword_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});


  @override
  Widget build(BuildContext context) {
int? selectedIndex;

    return BaseView<ForgotPasswordModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
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
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Forgot\nPassword?",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: const Color(0xff4E4B66)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Don’t worry! it happens. Please select the \nor number associated with your \naccount.",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: const Color(0xff4E4B66)),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.sampleData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            model.changeisSelected(index);
                            selectedIndex=index;
                          },
                          child: RadioItem(model.sampleData[index]),
                        );
                      },
                    )
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.only(
                    bottom: UIHelper.HorizontalSpaceMedium,
                  ),
                  child: CustomButtonFullWidth(text: "Submit",click: () {
                    if (selectedIndex==0) {
                      Navigator.pushNamed(context, "forgotpasswordmail");
                      
                    }
                     else if(selectedIndex==1) {
                      Navigator.pushNamed(context, "forgorpasswordmessage");
                      
                    }
                  },),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
