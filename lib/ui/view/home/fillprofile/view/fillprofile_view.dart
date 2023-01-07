import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';

import '../../../../shared/ui_helpers.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  String username = "Username";
  String fullname = "Full Name";
  String email = "Email Address";
  String phone = "Phone Number";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fill your Profile",
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
          children: [
            Column(
              children: [
                const InkWell(
                  onTap: null,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage("assets/images/ob_1.png"),
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: UIHelper.HorizontalSpaceSmall,
                      bottom: UIHelper.HorizontalSpaceSmall),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff4E4B66))),
                        hintText: username,
                        labelText: username,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: UIHelper.HorizontalSpaceSmall,
                      bottom: UIHelper.HorizontalSpaceSmall),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff4E4B66))),
                        hintText: fullname,
                        labelText: fullname,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: UIHelper.HorizontalSpaceSmall,
                      bottom: UIHelper.HorizontalSpaceSmall),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff4E4B66))),
                        hintText: phone,
                        labelText: phone,
                      ),
                    ),
                  ),
                ),
              ],
            ),
             const Padding(
               padding: EdgeInsets.only(bottom: UIHelper.HorizontalSpaceSmall),
               child: customButton(text: "Next"),
             )
          ],
        ),
      ),
    );
  }
}
