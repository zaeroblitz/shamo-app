import 'package:flutter/material.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_buble.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
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

  Widget productPreview() {
    return Container(
      width: 250,
      height: 74,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor5,
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.product.galleries[0].url,
              width: 54,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.product.name}',
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$ ${widget.product.price}',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.product = UninitializedProductModel();
              });
            },
            child: Image.asset(
              'assets/close_icon.png',
              width: 22,
            ),
          )
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: ListView(
        children: [
          ChatBuble(
            isSender: true,
            message: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBuble(
            isSender: false,
            message:
                'Good night, This item is only available in size 42 and 43',
          ),
          ChatBuble(
            isSender: true,
            message: "It's suit me well",
          ),
        ],
      ),
    );
  }

  Widget chatInput() {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.product is UninitializedProductModel
              ? SizedBox()
              : productPreview(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 48,
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
                width: 48,
              ),
            ],
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
      body: content(),
    );
  }
}
