import 'dart:convert';
import 'package:eccomernce/providers/item_provider.dart';
import 'package:eccomernce/screens/cart_screen.dart';
import 'package:eccomernce/screens/item_screen.dart';
import 'package:provider/provider.dart';
import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/services/http_app_request.dart';
import 'package:eccomernce/services/shared_pref.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  List<dynamic> _categories = [];

  List<ItemModel> _activeProducts = [];

  String? _selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() {
      _isLoading = true;
    });
    _categories = await HTTPAppRequests.fetchAndSetCategories();
    _activeProducts =
        await HTTPAppRequests.fetchAllProductsForCategory(_categories[0]);
    setState(() {
      _selectedCategory = _categories[0];
      _isLoading = false;
    });
  }

  void _loadDifferentProducts(String category) async {
    setState(() {
      _isLoading = true;
    });
    _activeProducts =
        await HTTPAppRequests.fetchAllProductsForCategory(category);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CartScreen.id);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          child: Icon(
            Icons.shopping_cart,
            size: 40,
            color: Colors.lightBlue,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
              ),
            )
          : Column(
              children: [
                _buildNestedNavBar(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: _buildItemWidgets(_activeProducts, context),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
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
                          onPressed: () {
                            Navigator.of(ctx).pushNamed(ItemScreen.id);
                          },
                          child: Text("More")),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .addItemToCart(item.id.toString());
                          },
                          child: Text("Add To Cart")),
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
              color: _selectedCategory == _categories[0]
                  ? Colors.lightBlue
                  : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[0];
                  });
                  _loadDifferentProducts(_categories[0]);
                },
                child: Text(
                  _categories[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: _selectedCategory == _categories[1]
                  ? Colors.lightBlue
                  : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[1];
                    // _activeProducts = _jeweleryCategory;
                  });
                  _loadDifferentProducts(_categories[1]);
                },
                child: Text(
                  _categories[1],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: _selectedCategory == _categories[2]
                  ? Colors.lightBlue
                  : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[2];
                    // _activeProducts = _mensCategory;
                  });
                  _loadDifferentProducts(_categories[2]);
                },
                child: Text(
                  _categories[2],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: _selectedCategory == _categories[3]
                  ? Colors.lightBlue
                  : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[3];
                  });
                  _loadDifferentProducts(_categories[3]);
                },
                child: Text(
                  _categories[3],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
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
}
