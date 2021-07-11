import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatPage extends StatelessWidget {
  Widget header() {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(36),
        ),
      ),
      child: Center(
        child: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget defaultBody() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/headset_icon.png',
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Opss no message yet?',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'You have never done a transaction',
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
                    borderRadius: BorderRadius.circular(24),
                  )),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                child: Text(
                  'Explore State',
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            header(),
            defaultBody(),
          ],
        ),
        // child: body(),
      ),
    );
  }
}
