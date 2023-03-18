import 'package:badges/badges.dart';
import 'package:e_commerce/ui/pages/wish_list_page.dart';
import 'package:e_commerce/ui/user_profile.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/widgets/badge.dart';
import 'package:flutter/material.dart';

import '../cart_page.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [
    HomeView(),
    WishListView(),
    CartView(),
    UserProfile()
  ];
  OnTap onTap = OnTap();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: onTap,
      builder: (context, value, child) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: value,
              children: pages,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: mainColor,
              unselectedItemColor: grey,
              currentIndex: value,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              onTap: (index) => onTap.whenTapped(index),
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: 'Wishlist'),
                BottomNavigationBarItem(icon: CartBadge(), label: 'Cart'),
              ]),
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
