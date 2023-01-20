import 'package:flutter/material.dart';
import 'package:newsapp/core/services/auth_service.dart';

import '../../../../../widgets/custom_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Settings",
          fontSize: 16,
          weight: FontWeight.w400,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.notifications_outlined,color: Colors.black),
            title: CustomText(
                text: "Notification", fontSize: 16, weight: FontWeight.w400,color: Colors.black),
                trailing: Icon(Icons.chevron_right,color: Color(0xff4E4B66)),
          ),
          const ListTile(
            leading: Icon(Icons.lock_outline,color: Colors.black),
            title: CustomText(
                text: "Security", fontSize: 16, weight: FontWeight.w400,color: Colors.black),
                trailing: Icon(Icons.chevron_right,color: Color(0xff4E4B66)),
          ),const ListTile(
            leading: Icon(Icons.help_outline,color: Colors.black),
            title: CustomText(
                text: "Help", fontSize: 16, weight: FontWeight.w400,color: Colors.black),
                trailing: Icon(Icons.chevron_right,color: Color(0xff4E4B66)),
          ),const ListTile(
            leading: Icon(Icons.dark_mode_outlined,color: Colors.black),
            title: CustomText(
                text: "Dark Mode", fontSize: 16, weight: FontWeight.w400,color: Colors.black),
                trailing: Switch(value: false, onChanged:null),
          ),InkWell(
            onTap: () async{
              var _authService=AuthenticationService();
             await _authService.logout();
             if(!context.mounted)return;
              Navigator.pushNamed(context, "login");
            },
            child: const ListTile(
              leading: Icon(Icons.logout,color: Colors.black),
              title: CustomText(
                  text: "Logout", fontSize: 16, weight: FontWeight.w400,color: Colors.black),
            ),
          ),
          
        ],
      ),
    );
  }
}
