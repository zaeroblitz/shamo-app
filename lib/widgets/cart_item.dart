import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // NOTE: Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12,
              ),

              // NOTE: Product Name & Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adidas SL 20 Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('\$ 50,00', style: priceTextStyle),
                  ],
                ),
              ),

              // NOTE: Plus & Minus Icon
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset('assets/add_icon.png', width: 12),
                    onTap: () {},
                  ),
                  Container(
                    child: Text(
                      '2',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/reduce_icon.png',
                      width: 12,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_delete.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
