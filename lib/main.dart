import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/product_detail_data.dart';
import 'package:e_commerce/ui/pages/home_page.dart';
import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainScreen()),
    );
  }
}
