import 'package:eccomernce/view/auth_screen.dart';
import 'package:eccomernce/view/cart_screen.dart';
import 'package:eccomernce/view/home_screen.dart';
import 'package:eccomernce/view/item_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        AuthenticationScreen.id: (_) => AuthenticationScreen(),
        CartScreen.id: (_) => CartScreen(),
        ItemScreen.id: (_) => ItemScreen(),
        HomeScreen.id: (_) => HomeScreen(),
      },
    );
  }
}
