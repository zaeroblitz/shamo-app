import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              'assets/image_shoes.png',
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
                    'Adidas Ultraboost SL 20 Shoes ',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text(
                  '\$ 50,00',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 34,
            height: 34,
            child: Image.asset('assets/wishlist_button_blue.png'),
          )
        ],
      ),
    );
  }
}
