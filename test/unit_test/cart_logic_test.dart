import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/controllers/cart_controller.dart';

void main() {
  late CartController state;

  setUp((){
    state = CartController();
  });

  group('ShoppingCart Tests', () {
    test('Adding duplicate item increases quantity', () {
      state.addItem('1', "iPhone", 1000);
      state.addItem('1', "iPhone", 1000);
      expect(state.totalItems, 2);
    });

    test('Discount and total calculation', () {
      state.addItem("1", "iPhone", 1000,discount: 0.1);
      expect(state.totalDiscount, 100);
      expect(state.totalAmount, 900);
    });
  });

  test('Removing item updates totals', () {
    state.addItem("1", "iPhone", 1000);
    state.removeItem("1");
    expect(state.totalItems, 0);
    expect(state.totalAmount,0);
  });

  test('Empty cart edge case', () {
    expect(state.totalItems, 0);
    expect(state.totalAmount,0);
  });

  test('100% discount', () {
    state.addItem("1", "iPhone", 1000, discount: 1);
    expect(state.totalItems, 1);
    expect(state.totalAmount,0);
  });

  test('quantity limit is enforced', () {
    state.addItem("1", "iPhone", 1000);

    for (int i = 0; i<20; i++){
      state.addItem("1", "iPhone", 1000);
    }
    expect(state.items.first.quantity, CartController.maxQuantityPerItem);
    expect(state.totalItems, CartController.maxQuantityPerItem);
  });

}
