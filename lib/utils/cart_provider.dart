import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartList = [];

  List<Map<String, dynamic>> getCartList() {
    return _cartList;
  }

  void addItem(Map<String, dynamic> item) {
    int itemIndex = _cartList.lastIndexWhere(
      (element) => element['name'] == item['name'],
    );

    if (itemIndex == -1) {
      Map<String, dynamic> mutableItem = Map<String, dynamic>.from(item);
      mutableItem['quantity'] = 1;
      _cartList.add(mutableItem);
      notifyListeners();
    } else {
      incrementQuantity(itemIndex);
    }
  }

  void deleteItem(int index) {
    if (index >= 0 && index < _cartList.length) {
      _cartList.removeAt(index);
      notifyListeners();
    }
  }

  void incrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'] as int;
    if (currentQuantity < 10) {
      currentQuantity++;
      _cartList[index]['quantity'] = currentQuantity;
      notifyListeners();
    }
  }

  /// Decrements item count value, removing it completely if it drops below 1
  void decrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'] as int;
    if (currentQuantity > 1) {
      currentQuantity--;
      _cartList[index]['quantity'] = currentQuantity;
      notifyListeners();
    } else {
      // Auto-drops item out of view if quantity reaches zero
      deleteItem(index);
    }
  }

  /// Empties out all cached product nodes inside the cart vector
  void clear() {
    _cartList.clear();
    notifyListeners();
  }

  /// Calculates the total combined count of product instances inside the basket
  int getCartCount() {
    int count = 0;
    for (var item in _cartList) {
      // Safe addition directly pulling native integer type fields
      count += item['quantity'] as int;
    }
    return count;
  }

  /// Loops through entries, converts text prices to double values, and solves cost aggregates
  double getCartTotal() {
    double cartTotal = 0;
    for (var item in _cartList) {
      // Converts data dynamically to eliminate data type layout multiplication conflicts
      double price = double.parse(item['price'].toString());
      int quantity = item['quantity'] as int;

      cartTotal += price * quantity;
    }
    return cartTotal;
  }
}
