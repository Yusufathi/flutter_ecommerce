import 'package:eccomernce/providers/item_provider.dart';
import 'package:eccomernce/screens/auth_screen.dart';
import 'package:eccomernce/screens/cart_screen.dart';
import 'package:eccomernce/screens/home_screen.dart';
import 'package:eccomernce/screens/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (_) => LoginScreen(),
        CartScreen.id: (_) => CartScreen(),
        ItemScreen.id: (_) => ItemScreen(),
        HomeScreen.id: (_) => HomeScreen(),
      },
    );
  }
}
