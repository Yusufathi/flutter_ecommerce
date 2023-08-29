import 'dart:convert';

import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/services/http_app_request.dart';
import 'package:eccomernce/view/item_screen.dart';
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


  String? _selectedCategory ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    _categories = await HTTPAppRequest.fetchAndSetCategories();

    setState(() {
      _selectedCategory = _categories[0];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        children: _buildItemWidgets(_activeProducts,context),
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
      color: Colors.white,
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
                          onPressed: () {}, child: Text("Add To Cart")),
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
              color: _selectedCategory == _categories[0] ?Colors.lightBlue : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[0];
                    _activeProducts = _electornicsCategory;
                  });
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
              color: _selectedCategory == _categories[1] ?Colors.lightBlue : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[1];
                    _activeProducts = _jeweleryCategory;
                  });
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
              color:_selectedCategory == _categories[2] ?Colors.lightBlue : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[2];
                    _activeProducts = _mensCategory;
                  });
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
              color: _selectedCategory == _categories[3] ?Colors.lightBlue : Colors.indigo,
              height: 70,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _selectedCategory = _categories[3];
                    _activeProducts = _womensCategory;
                  });
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
  
  List<Widget> _buildItemWidgets(List<ItemModel> activeCategoryProducts,BuildContext context) {
    List<Widget> items = [];
    if(activeCategoryProducts.isEmpty) {
      activeCategoryProducts = _electornicsCategory;
    }
    for (ItemModel item in activeCategoryProducts) {
      items.add(_buildItemWidget(item, context));
    }
    return items;
  }


}
