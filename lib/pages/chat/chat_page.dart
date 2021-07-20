import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/MessageModel.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
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

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      'Explore Store',
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
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessagesById(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                emptyChat();
              }

              return Container(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
                child: Column(
                  children: [
                    ChatTile(),
                  ],
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return SafeArea(
      child: Container(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
        // child: body(),
      ),
    );
  }
}
