import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:newsapp/ui/view/base_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/enum/viewstate.dart';
import '../../../../shared/helpers/helper.dart';
import '../../../widget/custombutton.dart';

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

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
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
                        color: const Color(0xff1877F2)),
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
              TextField(
                controller: _passwordcontroller,
                obscureText: !model.passwordVisible,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff4E4B66))),
                    hintText: password,
                    labelText: password,
                    suffixIcon: IconButton(
                      icon: Icon(model.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        model.changePasswordVisible();
                      },
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        Navigator.pushNamed(context, "forgotpassword");
                      },
                      child: Text(
                        forgotpassword,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff5890FF)),
                      )),
                ],
              ),
              Text(
                model.errorMessage,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: UIHelper.HorizontalSpaceMedium,
                    bottom: UIHelper.HorizontalSpaceMedium),
                child: model.state == ViewState.Busy
                    ? const CircularProgressIndicator()
                    : CustomButtonFullWidth(
                        text: login,
                        click: () async {
                          var result = await model.login(
                              _emailcontroller.text, _passwordcontroller.text);
                          //  var result= await model.login(_emailcontroller.text, _passwordcontroller.text);
                          if (!context.mounted) return;
                          (result)
                              ? Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "selecttopics",
                                  (route) => false,
                                )
                              : print(model.errorMessage);
                        },
                      ),
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
                    GestureDetector(
                      onTap: () async {
                        var result=await model.googleLogin();
                        if (result==true) {
                          if(!context.mounted)return;
                          Navigator.pushNamed(context, "selecttopics");
                          
                        } else {
                          
                        }
                      },
                      child: Container(
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
                      onPressed: () => Navigator.pushNamed(context, "register"),
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
