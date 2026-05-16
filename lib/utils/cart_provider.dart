class CartProvider {
  List<Map<String, dynamic>> _cartList = [];

  void addItem(Map<String, dynamic> item) {
    int itemIndex = _cartList.lastIndexWhere(
      (element) => element['name'] == item['name'],
    );
    if (itemIndex == -1) {
      item['quantity'] = 1;
      _cartList.add(item);
    } else {
      incrementQuantity(itemIndex);
    }
  }

  void deleteItem(int index) {
    _cartList.removeAt(index);
  }

  void incrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'];
    if (currentQuantity < 10) {
      currentQuantity++;
      _cartList[index]['quantity'] = currentQuantity;
    }
  }

  void decrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'];
    if (currentQuantity > 1) {
      currentQuantity--;
      _cartList[index]['quantity'] = currentQuantity;
    } else {
      deleteItem(index);
    }
  }

  void clear() {
    _cartList.clear();
  }

  int getCartCount() {
    int count = 0;
    for (var item in _cartList) {
      count += int.parse(item['quantity']);
    }
    return count;
  }

  double getCartTotal() {
    double CartTotal = 0;
    for (var item in _cartList) {
      double amount = item['price'] * item['quantity'];
      CartTotal += amount;
    }
    return CartTotal;
  }

  List<Map<String, dynamic>> getCartList() {
    return _cartList;
  }
}
