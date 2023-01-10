import 'package:flutter/material.dart';
import 'package:newsapp/core/extension/imageextension.dart';
import 'package:newsapp/ui/shared/ui_helpers.dart';
import 'package:newsapp/ui/widgets/custom_text.dart';

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

class PersonNotification extends StatelessWidget {
  const PersonNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffEEF1F4),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              "logo".getimage(),
              height: 70,
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomText(
                    text:
                        "BBC News has posted new europe news “Ukraine's President Zele...”",
                    maxLines: 2,
                    fontSize: 16,
                    weight: FontWeight.w600),
                CustomText(
                  text: "15m ago",
                  maxLines: 1,
                  fontSize: 13,
                  weight: FontWeight.w400,
                  color: Color(0xff4e4b66),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 8, left: 15),
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xff1877F2),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(children: const [
              Icon(
                Icons.add,
                color: Color(0xff1877F2),
                size: 24,
              ),
              CustomText(
                text: "Follow",
                fontSize: 16,
                weight: FontWeight.w600,
                color: Color(0xff1877F2),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class NewsNotification extends StatelessWidget {
  const NewsNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffEEF1F4),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              "logo".getimage(),
              height: 70,
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomText(
                    text:
                        "BBC News has posted new europe news “Ukraine's President Zele...”",
                    maxLines: 2,
                    fontSize: 16,
                    weight: FontWeight.w600),
                CustomText(
                  text: "15m ago",
                  maxLines: 1,
                  fontSize: 13,
                  weight: FontWeight.w400,
                  color: Color(0xff4e4b66),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
