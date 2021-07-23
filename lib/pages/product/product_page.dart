import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/pages/chat/detail_chat_page.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage({this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/success_icon.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24,
                        )),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

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
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Image.asset(
                    'assets/cart_icon_black.png',
                    width: 20,
                  ),
                ),
              ],
            ),

            // NOTE: Product Gallery
            CarouselSlider(
              items: widget.product.galleries
                  .map(
                    (gallery) => Image.network(
                      gallery.url,
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
              children: widget.product.galleries.map((gallery) {
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
                      '${widget.product.name}',
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
              onTap: () {
                setState(() {
                  wishlistProvider.setProduct(widget.product);

                  if (wishlistProvider.isWishlist(widget.product)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: secondaryColor,
                        duration: Duration(milliseconds: 750),
                        content: Text(
                          'Has been add to the wishlist',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        duration: Duration(milliseconds: 750),
                        content: Text(
                          'Has been removed from the wishlist',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                });
              },
              child: Image.asset(
                wishlistProvider.isWishlist(widget.product)
                    ? 'assets/wishlist_button_blue.png'
                    : 'assets/wishlist_icon_black.png',
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
              '\$ ${widget.product.price}',
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
              '${widget.product.description}',
              style: subtitleTextStyle.copyWith(
                fontWeight: light,
              ),
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
                children: productProvider.products.map((product) {
                  index++;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : 16,
                        top: 12,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(product.galleries[0].url),
                            fit: BoxFit.cover,
                          )),
                    ),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailChatPage(widget.product)));
              },
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
              onPressed: () {
                cartProvider.addCart(widget.product);
                showSuccessDialog();
              },
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
