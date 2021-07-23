import 'package:flutter/cupertino.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/services/product_service.dart';

class SearchProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProductsByName(String query) async {
    try {
      List<ProductModel> products =
          await ProductService().getProductsByName(query);
      _products = products;
      return products;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProductsByCategory(int categoryId) async {
    try {
      List<ProductModel> products =
          await ProductService().getProductsByCategory(categoryId);
      _products = products;
      return products;
    } catch (e) {
      print(e);
    }
  }
}
