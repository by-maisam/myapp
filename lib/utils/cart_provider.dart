import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // Internal list storing items currently in the shopping cart bucket
  final List<Map<String, dynamic>> _cartList = [];

  /// Retrieves the active list of items added to the cart
  List<Map<String, dynamic>> getCartList() {
    return _cartList;
  }

  /// Adds a product item to the basket or increments its count if it exists
  void addItem(Map<String, dynamic> item) {
    // Check if the product configuration is already present in the cart array
    int itemIndex = _cartList.lastIndexWhere(
      (element) => element['name'] == item['name'],
    );

    if (itemIndex == -1) {
      // Create a clean, independent map copy to avoid editing global data models
      Map<String, dynamic> mutableItem = Map<String, dynamic>.from(item);
      mutableItem['quantity'] = 1; // Stored natively as an integer type
      _cartList.add(mutableItem);
      notifyListeners();
    } else {
      // If the product is already in the list, simply scale its count up
      incrementQuantity(itemIndex);
    }
  }

  /// Direct removal of a product slot position from the tracking queue
  void deleteItem(int index) {
    if (index >= 0 && index < _cartList.length) {
      _cartList.removeAt(index);
      notifyListeners();
    }
  }

  /// Increments product quantity up to a max restriction boundary threshold of 10
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
