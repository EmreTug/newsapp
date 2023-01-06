import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/view/authenticate/register/viewmodel/register_viewmodel.dart';

import '../../../../shared/ui_helpers.dart';
import '../../../base_view.dart';
import '../../../widget/custombutton.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final String signup = "Sign Up";
  final String hello = "Hello!";
  final String getstarted = "Signup to get Started";
  final String rememberme = "Remember me";
  final String forgotpassword = "Forgot the password?";
  final String login = "login";
  final String or = "or continue with";
  final String facebook = "Facebook";
  final String google = "Google";
  final String email = "Email";
  final String password = "Password";
  final String account = "Already have an account ?";
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: UIHelper.VerticalSpaceMedium,
                right: UIHelper.VerticalSpaceMedium),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    hello,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: Color(0xff1877F2)),
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    getstarted,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xff4E4B66)),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceLarge,
                    bottom: UIHelper.HorizontalSpaceSmall),
                child: TextField(
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
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff4E4B66))),
                  hintText: password,
                  labelText: password,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (value) {
                      check = (value == null) ? false : value;
                    },
                  ),
                  Text(rememberme),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceMedium,
                    bottom: UIHelper.HorizontalSpaceMedium),
                child: customButton(text: signup),
              ),
              Text(or),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceMedium,
                    bottom: UIHelper.HorizontalSpaceMedium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: 160,
                      color: const Color(0xffEEF1F4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 24,
                            ),
                          ),
                          Text(facebook,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 160,
                      color: const Color(0xffEEF1F4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(
                                "ic_google".getSvg(),
                                width: 24,
                                height: 24,
                              )),
                          Text(google,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(account,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff4E4B66))),
                  TextButton(
                      onPressed: ()=>Navigator.pushNamed(context, "login"),
                      child: Text(login,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xff1877F2))))
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}