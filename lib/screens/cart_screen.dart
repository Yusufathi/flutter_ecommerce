import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/providers/item_provider.dart';
import 'package:eccomernce/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String id = "cart_screen";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late bool _isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "The Total is: ${context.read<CartProvider>().getCartTotal()}\$",
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Screen'),
      ),
      body: _isLoading
          ? LoadingIndicator(indicatorType: Indicator.ballZigZag)
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: _buildItemWidgets(
                    context.watch<CartProvider>().cartItems,
                    context,
                  ),
                ),
              ),
            ),
    );
  }

  List<Widget> _buildItemWidgets(
      List<ItemModel> activeCategoryProducts, BuildContext context) {
    List<Widget> items = [];

    for (ItemModel item in activeCategoryProducts) {
      items.add(_buildItemWidget(item, context));
    }
    return items;
  }

  Container _buildItemWidget(ItemModel item, BuildContext ctx) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.blueAccent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Image.network(item.imgPath!)),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title!,
                    style: TextStyle(fontSize: 15),
                  ),
                  // Text(item.briefDescription!,style: TextStyle(overflow: TextOverflow.fade),),
                  Text(("${item.price}\$")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            context
                                .read<CartProvider>()
                                .removeItem(item.id.toString());
                            // _loadData();
                          },
                          child: Text("Remove")),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
