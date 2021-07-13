import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List productImages = [
    'assets/image_shoes.png',
    'assets/image_shoes_2.png',
    'assets/image_shoes_3.png',
    'assets/image_shoes.png',
    'assets/image_shoes_2.png',
    'assets/image_shoes_3.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          color: currentIndex == index ? primaryColor : greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
      );
    }

    Widget header() {
      int index = -1;

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
            CarouselSlider(
              items: productImages
                  .map(
                    (productImage) => Image.asset(
                      productImage,
                      width: double.infinity,
                      height: 310,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productImages.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            ),
          ],
        ),
      );
    }

    Widget contentProductName() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      'Adidas Ultraboost SL 20 Shoes',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Running',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              child: Image.asset(
                'assets/wishlist_icon_black.png',
                width: 46,
                height: 46,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      );
    }

    Widget contentProductPrice() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 30,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price starts from',
              style: primaryTextStyle,
            ),
            Text(
              '\$ 50,00',
              style: priceTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            )
          ],
        ),
      );
    }

    Widget contentProductDescription() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Text(
              'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
              style: subtitleTextStyle.copyWith(
                fontWeight: light,
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      );
    }

    Widget contentProductSimilarShoes() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Similar Shoes',
              style: primaryTextStyle.copyWith(fontWeight: medium),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productImages.map((productImage) {
                  index++;
                  return Container(
                    width: 54,
                    height: 54,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 16,
                      top: 12,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(productImage),
                          fit: BoxFit.cover,
                        )),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentButton() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
              ),
              child: Image.asset(
                'assets/chat_icon_purple.png',
                width: 24,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 76,
                    vertical: 16,
                  )),
              child: Text(
                'Add to Chart',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
            contentProductName(),
            contentProductPrice(),
            contentProductDescription(),
            contentProductSimilarShoes(),
            contentButton(),
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
            content(),
          ],
        ),
      ),
    );
  }
}
