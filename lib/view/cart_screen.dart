import 'package:eccomernce/model/item_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String id = "cart_screen";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Screen'),
      ),
      body: Container(),
    );
  }
}
