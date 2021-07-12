import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class DetailChatPage extends StatelessWidget {
  Widget appBar() {
    return PreferredSize(
      child: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/logo_shop_icon_online.png',
                  width: 50,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Online',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
    );
  }
}
