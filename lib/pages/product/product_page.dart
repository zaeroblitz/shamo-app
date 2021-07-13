import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
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
                    color: backgroundColor1,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/cart_icon_black.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: SafeArea(
          child: ListView(
        children: [
          header(),
        ],
      )),
    );
  }
}
