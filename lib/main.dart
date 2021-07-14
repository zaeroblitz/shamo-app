import 'package:flutter/material.dart';
import 'package:shamo/pages/cart/cart_page.dart';
import 'package:shamo/pages/chat/detail_chat_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/product/product_page.dart';
import 'package:shamo/pages/profile/edit_profile.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/signInPage': (context) => SignInPage(),
        '/signUpPage': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detailChat': (context) => DetailChatPage(),
        '/editProfile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
