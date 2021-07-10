import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/new_arrival_card.dart';
import 'package:shamo/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Zaero',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@zaeroblitz',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/image_profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: Text(
                'All Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: subtitleTextColor),
                color: transparentColor,
              ),
              child: Text(
                'Running',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: subtitleTextColor),
                color: transparentColor,
              ),
              child: Text(
                'Training',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: subtitleTextColor),
                color: transparentColor,
              ),
              child: Text(
                'Basketball',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.5, color: subtitleTextColor),
                color: transparentColor,
              ),
              child: Text(
                'Hiking',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularProductsTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Text(
        'Popular Products',
        style: primaryTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget popularProducts() {
    return Container(
      margin: EdgeInsets.only(
        top: 14,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ],
        ),
      ),
    );
  }

  Widget newArrivalsTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        'New Arrivals',
        style: primaryTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget newArrivals() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewArrialCard(),
          NewArrialCard(),
          NewArrialCard(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
