import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/item_model.dart';
class HTTPAppRequest{

  static const String _rootEndPoint ="https://fakestoreapi.com/";
  static const String _categoriesEndPoint  = "products/categories";
  static const String _fetchProductsAccordingToTheirCategoryEndPoint = "products/category/";

  static Future<List<dynamic>> fetchAndSetCategories() async {
    http.Response data = await http.get(Uri.parse(_rootEndPoint+_categoriesEndPoint));
    List<dynamic> categories=[];
    categories = jsonDecode(data.body);
    return categories;
  }

  static Future<List<ItemModel>> fetchAllProductsForCategory(String category) async {
    http.Response data = await http.get(Uri.parse(_rootEndPoint+_fetchProductsAccordingToTheirCategoryEndPoint+category));
    var decodedData = jsonDecode(data.body);
    List<ItemModel> items = [];
    for(var item in decodedData){
      items.add(ItemModel.fromJson(item));
    }
    return items;
  }
}