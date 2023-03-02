import 'package:flutter/material.dart';

import 'itme.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;

  void addToCart(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  void removeCart(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Item> get itmesbasket {
    return _items;
  }
}
