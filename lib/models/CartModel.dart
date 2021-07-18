import 'package:shamo/models/ProductModel.dart';

class CartModel {
  int id;
  int quantity;
  ProductModel product;

  CartModel({this.id, this.product, this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'product': product.toJson(),
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
