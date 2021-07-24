import 'package:flutter/material.dart';
import 'package:shamo/models/CategoriModel.dart';
import 'package:shamo/pages/search/search_page.dart';
import 'package:shamo/theme.dart';

class CategoryItemCard extends StatelessWidget {
  final CategoryModel category;
  final bool isActive;

  CategoryItemCard({
    this.category,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchPage(
                      category.id.toString(),
                      categoryName: category.name,
                      isCategory: true,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : transparentColor,
          border: isActive
              ? Border.all(color: primaryColor, width: 0)
              : Border.all(color: subtitleTextColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          category.name,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
