import '../models/cart_model.dart';
import 'package:flutter/material.dart';

class CartController {
  static const int maxQuantityPerItem = 10;

  final ValueNotifier<List<CartItem>> itemsNotifier = ValueNotifier([]);

  List<CartItem> get items => itemsNotifier.value;

  void _update() {
    itemsNotifier.value = List.from(itemsNotifier.value);
  }

  void addItem(String id, String name, double price, {double discount = 0.0}) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      if(items[index].quantity < maxQuantityPerItem){
      items[index].quantity += 1;
    }} else {
      items.add(CartItem(id: id, name: name, price: price, discount: discount));
    }
    _update();
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
    _update();
  }

  void updateQuantity(String id, int newQuantity) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (newQuantity <= 0) {
        items.removeAt(index);
      } else {
        items[index].quantity = newQuantity;
      }
    }
    _update();
  }

  void clearCart() {
    items.clear();
    _update();
  }

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get totalDiscount =>
      items.fold(0, (sum, item) => sum + item.price * item.discount * item.quantity);

  double get totalAmount => subtotal - totalDiscount;

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}