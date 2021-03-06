import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/checkout_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_item.dart';
import 'package:shamo/widgets/loading_spinkit_button.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await checkoutProvider.checkout(authProvider.user.token,
          cartProvider.carts, cartProvider.totalPrice())) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkoutSuccess', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

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
                        'Checkout Details',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
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

    Widget addressDetails() {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Details',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: backgroundColor7,
                        ),
                        child: Image.asset(
                          'assets/store_location_icon.png',
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Dash(
                      direction: Axis.vertical,
                      length: 30,
                      dashLength: 5,
                      dashColor: Color(0xFFD8D8D8),
                    ),
                    ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor7,
                        ),
                        child: Image.asset(
                          'assets/your_location_icon.png',
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Shamo Store',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Address',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Beji, Depok',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget productSummary() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Summary',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Quantity',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${cartProvider.totalItems()} ' +
                        (cartProvider.totalItems() > 1 ? 'items' : 'item'),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Price',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$ ${cartProvider.totalPrice()}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Price',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$ 10',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xFF2E3141),
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: priceTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                Text(
                  '\$ ${cartProvider.totalPrice() + 10}',
                  style: priceTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: cartProvider.carts
                      .map((cart) => CheckoutItem(cart))
                      .toList(),
                ),
                addressDetails(),
                productSummary(),
              ],
            ),
          ),
        ],
      );
    }

    Widget checkoutNowButton() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: handleCheckout,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Checkout Now',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
      body: content(),
      bottomNavigationBar:
          isLoading ? LoadingButtonSpinkit() : checkoutNowButton(),
    );
  }
}
