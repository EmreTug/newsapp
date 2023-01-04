import 'package:flutter/material.dart';
import 'package:newsapp/core/constants/AppConstants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Header(),
        Categories(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.white,
                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children:  [
                    const Text("''Messi mi, Ronaldo mu?'' sorusu için ne dediler? ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),maxLines: 2,),
                    const Text(
                      "'MESSI Mİ, RONALDO MU? 21. yüzyılın dünyadaki en iyi iki futbolcusu olarak gösterilen Lionel Messi ve Cristiano Ronaldo için futbol adamları ne dedi? İşte...",
                    style: TextStyle(fontSize: 12),maxLines: 3,),
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      height: 160,
                      width: MediaQuery.of(context).size.width-50,
                      decoration:const BoxDecoration(
      image: DecorationImage(image: AssetImage(AppConstants.EXAMPLE),
      fit: BoxFit.fill)
    ),)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    )));
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 13,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text("All")
              ],
            ),
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomIcon(icon: AppConstants.LOGO, size: 30),
          CustomSearchBar(),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 80,
        height: 35,
        padding: const EdgeInsets.only(bottom: 2, left: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              child: const TextField(
                decoration: InputDecoration.collapsed(hintText: 'Search'),
              ),
            ),
            const CustomIcon(
              icon: AppConstants.SEARCH,
              size: 20,
            )
          ],
        ));
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.size,
  });
  final double size;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(icon), fit: BoxFit.fill)),
    );
  }
}
