import 'package:flutter/cupertino.dart';
import 'package:shamo/models/CartModel.dart';
import 'package:shamo/models/ProductModel.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExists(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;

    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
      print(_carts.map((e) => e.id));
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    print(_carts.map((e) => e.id));
    notifyListeners();
  }

  totalItems() {
    int total = 0;

    for (var item in _carts) {
      total += item.quantity;
    }

    return total;
  }

  totalPrice() {
    double total = 0;

    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }

    return total;
  }

  productExists(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
