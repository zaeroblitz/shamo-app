import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/cart_icon_white.png',
        width: 20,
      ),
    );
  }

  Widget customButtonNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(36),
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 14,
                ),
                child: Image.asset(
                  'assets/home_icon.png',
                  width: 21,
                  color:
                      currentIndex == 0 ? primaryColor : unselectedNavbarColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 14,
                ),
                child: Image.asset(
                  'assets/chat_icon.png',
                  width: 20,
                  color:
                      currentIndex == 1 ? primaryColor : unselectedNavbarColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 14,
                ),
                child: Image.asset(
                  'assets/wishlist_icon.png',
                  width: 20,
                  color:
                      currentIndex == 2 ? primaryColor : unselectedNavbarColor,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 14,
                ),
                child: Image.asset(
                  'assets/profile_icon.png',
                  width: 18,
                  color:
                      currentIndex == 3 ? primaryColor : unselectedNavbarColor,
                ),
              ),
              label: '',
            ),
          ],
          backgroundColor: backgroundColor4,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              print(value);
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
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
