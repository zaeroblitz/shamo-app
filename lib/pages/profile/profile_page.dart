import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/image_profile.png',
                width: 48,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Zaero',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '@zaeroblitz',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: backgroundColor3,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/exit_button.png',
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget accountContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Profile',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Orders',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Help',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget generalContent() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy & Policy',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms of Services',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rate App',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: secondaryTextColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            header(),
            accountContent(),
            generalContent(),
          ],
        ),
      ),
    );
  }
}
