import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class NewArrialCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_shoes.png'),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Running',
                style: subtitleTextStyle.copyWith(fontSize: 12),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 72 - 120,
                child: Text(
                  'SL 20 Shoes',
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Text(
                '\$ 50,00',
                style: priceTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
