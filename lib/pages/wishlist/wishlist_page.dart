import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
                onPressed: () {
                  pageProvider.currentIndex = 0;
                },
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
            children: wishlistProvider.wishlist
                .map((product) => WishlistCard(product))
                .toList(),
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        child: Column(
          children: [
            header(),
            wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
          ],
        ),
      ),
    );
  }
}
