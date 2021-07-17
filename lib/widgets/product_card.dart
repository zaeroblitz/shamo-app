import 'package:flutter/material.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/pages/product/product_page.dart';
import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(
                      product: product,
                    )));
      },
      child: Container(
        width: 215,
        height: 288,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            // NOTE: Product Image
            Container(
              height: 150,
              width: 245,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.galleries[0].url),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: Product Category
                    Text(
                      '${product.category.name}',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),

                    // NOTE: Product Name
                    Text(
                      '${product.name}',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),

                    // NOTE: Product Price
                    Text(
                      '\$ ${product.price}',
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
