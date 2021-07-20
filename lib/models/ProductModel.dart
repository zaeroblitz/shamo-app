import 'package:shamo/models/CategoriModel.dart';
import 'package:shamo/models/GalleryModel.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel category;
  List<GalleryModel> galleries;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.galleries,
    this.createdAt,
    this.updatedAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': name,
      'decription': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
