import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/CartModel.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/theme.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                child: Image.network(
                  cart.product.galleries[0].url,
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
                      '${cart.product.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('\$ ${cart.product.price}', style: priceTextStyle),
                  ],
                ),
              ),

              // NOTE: Plus & Minus Icon
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset('assets/add_icon.png', width: 12),
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                  ),
                  Container(
                    child: Text(
                      cart.quantity.toString(),
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'assets/reduce_icon.png',
                      width: 12,
                    ),
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
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
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
          ),
        ],
      ),
    );
  }
}
