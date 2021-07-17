import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/provider/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    '${product.name}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text(
                  '\$ ${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: SizedBox(
              width: 34,
              height: 34,
              child: Image.asset('assets/wishlist_button_blue.png'),
            ),
          )
        ],
      ),
    );
  }
}
