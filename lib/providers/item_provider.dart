import 'package:eccomernce/model/item_model.dart';
import 'package:eccomernce/services/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:eccomernce/services/http_app_request.dart';

class CartProvider with ChangeNotifier {
  late List<ItemModel> _cartItems;

  CartProvider() {
    _cartItems = [];
    _getDataFromStorage();
  }

  List<ItemModel> get cartItems => _cartItems;

  void removeItem(String id) async {
    await SharedPref.removeFromCart(id);
    await _getDataFromStorage();
    notifyListeners();
  }

  Future<void> _getDataFromStorage() async {
    List<String> ids = await SharedPref.getCartProducts();
    _cartItems.clear();
    for (String id in ids) {
      ItemModel item = await HTTPAppRequests.fetchSingleProduct(id);
      _cartItems.add(item);
    }
    notifyListeners();
  }

  Future<void> addItemToCart(String id) async {
    await SharedPref.saveCartProduct(id);
    await _getDataFromStorage();
    notifyListeners();
  }

  double getCartTotal() {
    double total = 0;

    for (ItemModel item in cartItems) {
      total += item.price ?? 0;
    }

    return total;
  }
}
