import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/enum/viewstate.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/view/authenticate/register/viewmodel/register_viewmodel.dart';

import '../../../../shared/helpers/helper.dart';
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
  String? emailerror;
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;


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
                child: TextFormField(
                  controller: _emailcontroller,
                  onChanged: (value) {
                   emailerror=Helper.validateEmail(value);
                    
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff4E4B66))),
                    hintText: email,
                    labelText: email,
                    errorText: emailerror,
                    
                  ),
                ),
              ),
              TextField(
                controller: _passwordcontroller,
                  obscureText:!model.passwordVisible,

                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff4E4B66))),
                  hintText: password,
                  labelText: password,
                   suffixIcon: IconButton(icon: Icon(model.passwordVisible?Icons.visibility:Icons.visibility_off),onPressed:() {
                    model.changePasswordVisible();
                   
                  } ,)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: model.check,
                    onChanged: (value) {
                     model.changeCheckBox();
                    },
                  ),
                  Text(rememberme),
                ],
              ),
              Text(
                        model.errorMessage,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color:  Colors.red),
                      ),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceMedium,
                    bottom: UIHelper.HorizontalSpaceMedium),
                child:(model.state==ViewState.Busy)?const CircularProgressIndicator(): customButton(text: signup,click: () async{
                 var result= await model.register(_emailcontroller.text, _passwordcontroller.text);
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
