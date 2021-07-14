import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_item.dart';

class CheckoutPage extends StatelessWidget {
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
                        'Checkout Details',
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

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: ListView(
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
            CheckoutItem(),
            CheckoutItem(),
            CheckoutItem(),
            addressDetails(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
      body: content(),
    );
  }
}
