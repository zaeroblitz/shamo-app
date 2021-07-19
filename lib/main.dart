import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart/cart_page.dart';
import 'package:shamo/pages/cart/checkout_page.dart';
import 'package:shamo/pages/cart/checkout_success.dart';
import 'package:shamo/pages/chat/detail_chat_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/profile/edit_profile.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/provider/auth_provider.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/checkout_provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/provider/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signInPage': (context) => SignInPage(),
          '/signUpPage': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detailChat': (context) => DetailChatPage(),
          '/editProfile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkoutSuccess': (context) => CheckoutSuccess(),
        },
      ),
    );
  }
}
