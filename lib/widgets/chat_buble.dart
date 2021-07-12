import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBuble extends StatelessWidget {
  final String message;
  final bool isSender;

  ChatBuble({
    this.message = '',
    this.isSender = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: isSender ? secondaryColor : backgroundColor5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isSender ? 12 : 0),
                  topRight: Radius.circular(isSender ? 0 : 12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Text(
                message,
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
