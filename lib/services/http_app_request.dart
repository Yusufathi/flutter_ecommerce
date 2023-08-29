import 'dart:convert';

import 'package:http/http.dart' as http;
class HTTPAppRequest{

  static const String _rootEndPoint ="https://fakestoreapi.com/";
  static const String _categoriesEndPoint  = "products/categories";
  static const String _fetchProductsAccordingToTheirCategoryEndPoint = "/products/category/";

  static Future<List<dynamic>> fetchAndSetCategories() async {
    http.Response data = await http.get(Uri.parse(_rootEndPoint+_categoriesEndPoint));
    List<dynamic> categories=[];
    categories = jsonDecode(data.body);
    return categories;
  }

  Future<void> fetchAllProducts() async {



  }
}