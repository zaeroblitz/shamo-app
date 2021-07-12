import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailChat');
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
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Good night, This item is on...',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
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
