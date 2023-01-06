import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:newsapp/ui/view/base_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/custombutton.dart';
String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String signup = "Sign Up";
  final String hello = "Hello";
  final String again = "Again!";
  final String welcome = "Welcome back you've \nbeen missed";
  final String rememberme = "Remember me";
  final String forgotpassword = "Forgot the password?";
  final String login = "Login";
  final String or = "or continue with";
  final String facebook = "Facebook";
  final String google = "Google";
  final String email = "Email";
  final String password = "Password";
  final String account = "don't have an account?";
    late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;
  bool check = false;
  bool _validate = false;
  String? emailerror;

  @override
  void initState() {
    _emailcontroller=TextEditingController();
    _passwordcontroller=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() { 
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(builder: (context, model, child) {
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
                  child: Text(hello,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, fontSize: 48))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    again,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                        color: Color(0xff1877F2)),
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Welcome back you've \nbeen missed",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xff4E4B66)),
                  )),

              Padding(
                padding: const EdgeInsets.only(top: UIHelper.HorizontalSpaceSmall,bottom: UIHelper.HorizontalSpaceSmall),
                child: TextFormField(
                  onChanged: (value) {
                   emailerror= validateEmail(value);
                   setState(() {
                     
                   });
                  },
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(borderSide:BorderSide( width: 1, color: Color(0xff4E4B66))),
                    hintText: email,
                    labelText: email,
                    errorText: emailerror,

                  ),
                ),
              ),
              TextField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(borderSide:BorderSide( width: 1, color: Color(0xff4E4B66))),
                  hintText: password,
                  labelText: password,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Checkbox(value: check, onChanged: (value) {
                         check=(value==null)?false:value;
                       },),
                      Text(rememberme),
                    ],
                  ),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        forgotpassword,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff5890FF)),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceMedium,
                    bottom: UIHelper.HorizontalSpaceMedium),
                child: customButton(text: login,click: () async{
                 var result= await model.login(_emailcontroller.text, _passwordcontroller.text);
                 if(!context.mounted)return;
                  (result)?Navigator.pushNamed(context, "/"):print(model.errorMessage);
                  
                },),
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
                            child: SvgPicture.asset("ic_google".getSvg(),width: 24,height: 24,)
                          ),
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
                      onPressed: ()=>Navigator.pushNamed(context, "register"),
                      child: Text(signup,
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
