import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsapp/core/model/filluser.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import '../../../../../shared/ui_helpers.dart';
import '../../../../base_view.dart';
import '../viewmodel/fillprofileviewmodel.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  late TextEditingController usernameController;
  late TextEditingController phoneNumberController;
  late TextEditingController fullNameController;
  @override
  void initState() {
usernameController=TextEditingController();
phoneNumberController=TextEditingController();
fullNameController=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    usernameController.dispose();
    phoneNumberController.dispose();
    fullNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      String username = "Username";
  String fullname = "Full Name";
  String phone = "Phone Number";
    return BaseView<FillProfileModel>(builder: (context, model, child) {
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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await model.getImage();
                        },
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 70.0,
                                backgroundImage: (model.getImageFile.path != "")
                                    ? FileImage(model.getImageFile)
                                    : null,
                                backgroundColor: const Color(0xffEEF1F4),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 4, right: 4),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff1877F2),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: const Icon(Icons.camera_alt_outlined,
                                        color: Colors.white, size: 30),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: UIHelper.HorizontalSpaceLarge,
                            bottom: UIHelper.HorizontalSpaceSmall),
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff4E4B66))),
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
                            controller: fullNameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff4E4B66))),
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
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff4E4B66))),
                              hintText: phone,
                              labelText: phone,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: UIHelper.HorizontalSpaceSmall),
                child: CustomButtonFullWidth(
                  text: "Next",
                  click: ()async {
                    model.addUserProfile(FillUser(usernameController.text, fullNameController.text, phoneNumberController.text, PickedFile(model.getImageFile.path)));
                    Navigator.pushNamedAndRemoveUntil(
                        context, "bottomnavigationbar", (route) => false);
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
