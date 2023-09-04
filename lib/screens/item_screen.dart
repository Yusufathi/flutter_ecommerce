import 'package:flutter/material.dart';

import '../model/item_model.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  static const String id = "item_screen";

  @override
  Widget build(BuildContext context) {
    ItemModel item = ItemModel(
      title: "IdeaPad",
      id: 5,
      category: "electronics",
      briefDescription: "Crazy Laptop. Good stuff.",
      fullDescription:
          "Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff.Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff.Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff.",
      price: 20.99,
      imgPath: "images/lenovo.jpg",
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Item Screen'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.deepPurpleAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item.imgPath!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.title!,
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          item.price.toString() + "\$",
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.briefDescription!,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.fullDescription!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("back"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Add to Cart"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
