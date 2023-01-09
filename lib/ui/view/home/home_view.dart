import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Center(
            child: Text(
          "Logo",
          style: TextStyle(color: Colors.black, fontSize: 15),
        )),
        actions: [
          Center(
            child: Container(
                margin: const EdgeInsets.only(right: 31),
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 0.3,color: Colors.black)
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 22,
                )),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: const Center(
        child: Text("home"),
      ),
    );
  }
}
