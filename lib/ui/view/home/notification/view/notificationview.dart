import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

import '../../../widget/newsnotification.dart';
import '../../../widget/personnotification.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const CustomText(
          text: "Notification",
          fontSize: 16,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.HorizontalSpaceMedium),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomText(
                text: "Today, April 22",
                fontSize: 16,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              NewsNotification(),
              SizedBox(
                height: 10,
              ),
              PersonNotification(),
              SizedBox(
                height: 10,
              ),
              NewsNotification(),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Yesterday, April 21",
                fontSize: 16,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              NewsNotification(),
              SizedBox(
                height: 10,
              ),
              PersonNotification(),
              SizedBox(
                height: 10,
              ),
              NewsNotification(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
