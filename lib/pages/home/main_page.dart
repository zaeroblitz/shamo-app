import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatelessWidget {
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
              icon: Image.asset(
                'assets/home_icon.png',
                width: 21,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/chat_icon.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/wishlist_icon.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/profile_icon.png',
                width: 18,
              ),
              label: '',
            ),
          ],
          backgroundColor: backgroundColor4,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
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
        child: ListView(
          children: [
            Text('MainPage'),
          ],
        ),
      ),
    );
  }
}
