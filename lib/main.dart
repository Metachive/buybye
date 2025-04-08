import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'models/product_list.dart';
import 'models/cart_list.dart';
import 'models/purchase_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductList()),
        ChangeNotifierProvider(create: (ctx) => CartList()),
        ChangeNotifierProvider(create: (ctx) => PurchaseList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            background: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const Homepage(),
      ),
    );
  }
}
