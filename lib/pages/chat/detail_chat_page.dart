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

  Widget chatInput() {
    return Container(
      height: 45,
      margin: EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor4,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type message...',
                    hintStyle: subtitleTextStyle,
                  ),
                  style: primaryTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Image.asset(
            'assets/send_button.png',
            width: 45,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
      bottomNavigationBar: chatInput(),
    );
  }
}
