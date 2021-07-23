import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/CategoriModel.dart';

class CategoriesService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<CategoryModel>> getCategories() async {
    var url = "$baseUrl/categories";
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }

      print(categories);
      return categories;
    } else {
      throw Exception('Get Categories Data Failed');
    }
  }
}
