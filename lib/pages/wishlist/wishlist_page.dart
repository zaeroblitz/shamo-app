import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishListPage extends StatelessWidget {
  Widget header() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(36),
        ),
      ),
      child: Center(
        child: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget emptyWishlist() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/wishlist_icon_blue.png',
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You don't have dream shoes?",
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
            style: secondaryTextStyle,
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              top: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            WishlistCard(),
            WishlistCard(),
            WishlistCard(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
