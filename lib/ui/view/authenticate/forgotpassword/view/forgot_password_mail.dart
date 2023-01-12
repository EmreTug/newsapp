import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/enum/viewstate.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/helpers/helper.dart';
import '../../../../shared/ui_helpers.dart';
import '../../../base_view.dart';
import '../../../widget/radioitem.dart';
import '../viewmodel/forgotpassword_viewmodel.dart';

class ForgotPasswordMail extends StatefulWidget {
  const ForgotPasswordMail({super.key});

  @override
  State<ForgotPasswordMail> createState() => _ForgotPasswordMailState();
}

class _ForgotPasswordMailState extends State<ForgotPasswordMail> {
  final String email = "Email";
  late TextEditingController _emailcontroller;
  @override
  void initState() {
    super.initState();
    _emailcontroller=TextEditingController();
  }
  @override
  void dispose() { 
      _emailcontroller.dispose();
    
    super.dispose();
  
    
  }

  @override
  Widget build(BuildContext context) {
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
                     Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceSmall,
                    bottom: UIHelper.HorizontalSpaceSmall),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: TextFormField(
                    validator: Helper.validateEmail,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff4E4B66))),
                      hintText: email,
                      labelText: email,
                    ),
                  ),
                ),
              ),
              ],
                ),
                 Padding(
                  padding: const EdgeInsets.only(
                    bottom: UIHelper.HorizontalSpaceMedium,
                  ),
                  child:model.state==ViewState.Busy?const CircularProgressIndicator(): CustomButtonFullWidth(text: "Submit",click: () {
                   model.forgotPassword(email);
                   Navigator.pushNamed(context, "success");
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
