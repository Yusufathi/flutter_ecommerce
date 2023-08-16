import 'dart:js';

import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/view/item_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text('Home Screen'),
      ),
      body: Container(
        child: Column(
          children: [
            _buildNestedNavBar(),
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildDummyWidgets(context),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildItemWidget(ItemModel item,BuildContext ctx) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Image.asset(item.imgPath)),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(item.briefDescription),
                  Text(("${item.price}\$")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.of(ctx).pushNamed(ItemScreen.id);
                      }, child: Text("More")),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: () {}, child: Text("Add To Cart")),
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

  Widget _buildNestedNavBar() {
    return Container(
      height: 70,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Laptop",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "PCs",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Laptop",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Laptop",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDummyWidgets(BuildContext context) {

    ItemModel item = ItemModel(
      name: "IdeaPad",
      briefDescription: "Crazy Laptop. Good stuff.",
      fullDescription:
      "Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff. Crazy Laptop. Good stuff.",
      price: 20.99,
      imgPath: "images/lenovo.jpg",
      stockCount: 23,
    );
    List<Widget> items= [];
    for(int i=0;i<5;i++){
      items.add(_buildItemWidget(item,context));
    }
    return items;

  }
}
