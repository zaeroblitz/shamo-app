import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Timer(Duration(seconds: 3),
    //     () => Navigator.pushNamed(context, '/signInPage'));

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/signInPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_splash_screen.png'),
              ),
            ),
          ),
        ));
  }
}
