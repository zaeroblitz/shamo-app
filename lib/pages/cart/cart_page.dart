import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return PreferredSize(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: backgroundColor1,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )),
              title: Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 24,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        'Your Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(60),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/shopping_cart_icon.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Opss! Your Cart is Empty',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Let's find your favorite shoes",
                style: subtitleTextStyle,
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      )),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    Widget subtotalAndButton() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: primaryTextStyle,
                ),
                Text(
                  '\$ 150,00',
                  style: priceTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue to Checkout',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: primaryTextColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: ListView(
          children: [
            CartItem(),
            CartItem(),
            CartItem(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
      body: content(),
      bottomNavigationBar: subtotalAndButton(),
    );
  }
}
