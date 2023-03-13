import 'package:badges/badges.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/widgets/badge.dart';
import 'package:flutter/material.dart';

import '../cart_page.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> pages = const [HomeView(), CartView()];

  @override
  Widget build(BuildContext context) {
    OnTap onTap = OnTap();
    return ValueListenableBuilder(
      valueListenable: onTap,
      builder: (context, value, child) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            bottom: false,
            child: pages[value],
          ),
          bottomNavigationBar: BottomAppBar(
            color: scaffold,
            child: BottomNavigationBar(
                backgroundColor: scaffold,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: mainColor,
                unselectedItemColor: grey,
                currentIndex: value,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                onTap: (index) => onTap.whenTapped(index),
                items:  [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: 'Home'),
                  BottomNavigationBarItem(icon: CartBadge(), label: 'Cart'),
                ]),
          ),
        );
      },
    );
  }
}

class OnTap extends ValueNotifier<int> {
  OnTap._sharedInference() : super(0);
  static final OnTap _shared = OnTap._sharedInference();
  factory OnTap() => _shared;
  void whenTapped(int index) {
    value = index;
    notifyListeners();
  }
}
