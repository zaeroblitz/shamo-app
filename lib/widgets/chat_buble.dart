import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBuble extends StatelessWidget {
  final String message;
  final bool isSender;
  final bool hasProduct;

  ChatBuble({
    this.message = '',
    this.isSender = false,
    this.hasProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 232,
        decoration: BoxDecoration(
          color: isSender ? secondaryColor : backgroundColor5,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 24 : 0),
            topRight: Radius.circular(isSender ? 0 : 24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image_shoes.png',
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adidas Ultraboos SL 20 Shoes Limited Edition',
                        style: primaryTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '\$ 50,00',
                        style: isSender
                            ? primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                              )
                            : priceTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: isSender ? primaryTextColor : primaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      )),
                  child: Text(
                    'Add to Cart',
                    style: isSender ? primaryTextStyle : purpleColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: isSender ? primaryTextColor : primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: isSender
                        ? secondaryButtonStyle.copyWith(
                            fontWeight: medium,
                          )
                        : blackTextStyle2.copyWith(fontWeight: medium),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: isSender ? secondaryColor : backgroundColor5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 24 : 0),
                      topRight: Radius.circular(isSender ? 0 : 24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
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
        ],
      ),
    );
  }
}
