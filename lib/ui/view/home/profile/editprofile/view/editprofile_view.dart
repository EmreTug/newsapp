import 'package:flutter/material.dart';
import 'package:newsapp/ui/view/widget/custombutton.dart';
import '../../../../../shared/ui_helpers.dart';
import '../../../../base_view.dart';
import '../../fillprofile/viewmodel/fillprofileviewmodel.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  
  @override
  Widget build(BuildContext context) {
      String username = "Username";
  String fullname = "Full Name";
  String phone = "Phone Number";
  String bio = "Bio";
  String website = "Website";

    return BaseView<FillProfileModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit your Profile",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [IconButton(
            icon: const Icon(Icons.check, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: UIHelper.VerticalSpaceMedium,
              right: UIHelper.VerticalSpaceMedium),
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
                            borderSide: BorderSide(
                                width: 1, color: Color(0xff4E4B66))),
                        hintText: bio,
                        labelText: bio,
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
                            borderSide: BorderSide(
                                width: 1, color: Color(0xff4E4B66))),
                        hintText: website,
                        labelText: website,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}