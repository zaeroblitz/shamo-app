import 'package:flutter/material.dart';
import 'package:shamo/models/MessageModel.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/pages/chat/detail_chat_page.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;
  ChatTile(this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/logo_shop_icon.png',
              width: 54,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '${message.message}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: light,
                      color: backgroundColor6,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            Spacer(),
            Text(
              'Now',
              style: primaryTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
