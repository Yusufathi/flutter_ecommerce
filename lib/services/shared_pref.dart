import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _cartProductsKey = "cart_items";

  static Future<void> saveCartProduct(String productID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsIds= prefs.getStringList(_cartProductsKey)??[];
    productsIds.add(productID);

    await prefs.setStringList(_cartProductsKey, productsIds);
  }

  static Future<List<String>> getCartProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsIds= prefs.getStringList(_cartProductsKey)??[];
    return productsIds;
  }

  static void removeFromCart(String id ) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productsIds= prefs.getStringList(_cartProductsKey)??[];
    productsIds.remove(id);
    await prefs.setStringList(_cartProductsKey, productsIds);
  }


}
