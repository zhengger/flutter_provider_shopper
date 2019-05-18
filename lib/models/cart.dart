// import 'dart:collection';
import 'package:provider_example/models/src/item.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// ignore: public_member_api_docs
class CartModel with ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart.
  List<Item> get items => _items;

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _items.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  /// Remove all items in the cart.
  // void dispose() {
  //   _items.clear();
  // }
}
