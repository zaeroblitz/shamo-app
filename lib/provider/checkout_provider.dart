import 'package:flutter/cupertino.dart';
import 'package:shamo/models/CartModel.dart';
import 'package:shamo/services/checkout_service.dart';

class CheckoutProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await CheckoutService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
