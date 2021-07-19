import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/CartModel.dart';

class CheckoutService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Beji, Depok',
      'items': carts
          .map((cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 10,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      throw Exception('Checkout Failed');
    }
  }
}
