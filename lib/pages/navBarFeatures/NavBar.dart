import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:exporter/pages/FevoriteView/fevoriteView.dart';
import 'package:exporter/pages/cart/cartScreen.dart';
import 'package:exporter/pages/home/homePage.dart';
import 'package:exporter/pages/navBarFeatures/menu.dart';
import 'package:exporter/pages/profile/profile.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  List pages = const [
    NavBarMenuFeature(),
    FevoriteScreenView(),
    HomePageView(),
    CartScreenView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: currentIndex,
          animationDuration: const Duration(milliseconds: 400),
          height: 60,
          buttonBackgroundColor: kprimaryColor,
          backgroundColor: Colors.white,
          color: const Color(0xffe7ecf3),
          items: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(Icons.grid_view_outlined,
                    color: currentIndex == 0 ? Colors.white : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(CupertinoIcons.heart,
                    color: currentIndex == 1 ? Colors.white : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(CupertinoIcons.home,
                    color: currentIndex == 2 ? Colors.white : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(Icons.shopping_cart,
                    color: currentIndex == 3 ? Colors.white : Colors.grey)),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(CupertinoIcons.profile_circled,
                    color: currentIndex == 4 ? Colors.white : Colors.grey)),
          ]),
    );
  }
}
