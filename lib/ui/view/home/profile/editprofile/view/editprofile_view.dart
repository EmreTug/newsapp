import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsapp/core/model/updateuser.dart';
import 'package:newsapp/ui/view/home/profile/editprofile/viewmodel/editprofile_viewmodel.dart';
import '../../../../../shared/ui_helpers.dart';
import '../../../../base_view.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController phonecontroller;
  late TextEditingController fullnamecontroller;
  late TextEditingController websitecontroller;
  late TextEditingController biocontroller;
  late TextEditingController usernamecontroller;
  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
    fullnamecontroller = TextEditingController();
    websitecontroller = TextEditingController();
    biocontroller = TextEditingController();
    usernamecontroller = TextEditingController();
  }

  @override
  void dispose() {
    phonecontroller.dispose();
    fullnamecontroller.dispose();
    websitecontroller.dispose();
    biocontroller.dispose();
    usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String username = "Username";
    String fullname = "Full Name";
    String phone = "Phone Number";
    String bio = "Bio";
    String website = "Website";

    return BaseView<EditProfileModel>(builder: (context, model, child) {
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
          actions: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.black),
              onPressed: () async {
              await  model.updateUserProfile(UpdateUser(
                    bio: biocontroller.text,
                    file: PickedFile(model.getImageFile.path),
                    fullname: fullnamecontroller.text,
                    phonenumber: phonecontroller.text,
                    username: usernamecontroller.text,
                    website: websitecontroller.text));
                    if(!context.mounted)return;
              Navigator.of(context).pop();
              },
            ),
          ],
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
                          padding: const EdgeInsets.only(bottom: 4, right: 4),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1877F2),
                                  borderRadius: BorderRadius.circular(18)),
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
                      controller: usernamecontroller,
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
                      controller: fullnamecontroller,
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
                      controller: phonecontroller,
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: UIHelper.HorizontalSpaceSmall,
                      bottom: UIHelper.HorizontalSpaceSmall),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      controller: biocontroller,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff4E4B66))),
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
                      controller: websitecontroller,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff4E4B66))),
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
