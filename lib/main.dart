import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/wishlist.dart';
import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:e_commerce/provider/product_detail_data.dart';
import 'package:e_commerce/provider/user_profile_pic.dart';
import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/ui/authentication/verification.dart';
import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (ctx) => AddToCartProvider()),
        ChangeNotifierProvider(create: (ctx) => CartCounterProvider()),
        ChangeNotifierProvider(create: (ctx) => WishListProvider()),
        ChangeNotifierProvider(create: (ctx) => UsersPic()),
        ChangeNotifierProvider(create: (ctx) => Authentication()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor)))),
        routes: {
          homeRoute: (context) => const MainScreen(),
          toggleBetweenUIRoute: (context) => const ToggleBetweenUi(),
          emailVerifyRoute: (context) => const EmailVerifyView(),
        },
        initialRoute: homeRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}
