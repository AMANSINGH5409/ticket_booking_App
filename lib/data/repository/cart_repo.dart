import 'dart:convert';

import 'package:food_delivery_app/Utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    //Convert Objects to string because sharedPreferences only accepts string.
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList("Cart-list", cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  void addToCartHistoryList() {
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);
  }

  void addToHistoryList() {
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
  }

  void removeCart() {
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
