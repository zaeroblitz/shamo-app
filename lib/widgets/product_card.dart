import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            height: 150,
            width: 245,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_shoes.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Running',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Adidas Ultraboost SL 20',
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$500',
                  style:
                      priceTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
