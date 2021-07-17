import 'package:flutter/material.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/pages/product/product_page.dart';
import 'package:shamo/theme.dart';

class NewArrialCard extends StatelessWidget {
  final ProductModel product;

  NewArrialCard({this.product});

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
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            // NOTE: Product Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.galleries[0].url),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: Product Category
                Text(
                  '${product.category.name}',
                  style: subtitleTextStyle.copyWith(fontSize: 12),
                ),

                // NOTE: Product Name
                SizedBox(
                  width: MediaQuery.of(context).size.width - 72 - 120,
                  child: Text(
                    '${product.name}',
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Text(
                  '\$ ${product.price}',
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
