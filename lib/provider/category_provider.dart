import 'package:flutter/cupertino.dart';
import 'package:shamo/models/CategoriModel.dart';
import 'package:shamo/services/categories_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  set categories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<void> getCategories() async {
    try {
      List<CategoryModel> categories =
          await CategoriesService().getCategories();
      _categories = categories;
    } catch (e) {
      print(e);
    }
  }
}
