import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/chat/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/profile/profile_page.dart';
import 'package:shamo/pages/wishlist/wishlist_page.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final iconList = [
    Icons.home_rounded,
    Icons.chat_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded
  ];

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/cart_icon_white.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? primaryColor : unselectedNavbarColor;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
              ],
            );
          },
          activeIndex: pageProvider.currentIndex,
          backgroundColor: backgroundColor2,
          splashColor: primaryColor,
          splashRadius: 20.0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          rightCornerRadius: 32,
          leftCornerRadius: 32,
          onTap: (value) {
            setState(() {
              pageProvider.currentIndex = value;
            });
          });
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishListPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: body(),
      ),
    );
  }
}
