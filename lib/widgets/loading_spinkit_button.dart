import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButtonSpinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: SpinKitWanderingCubes(
        size: 50,
        color: primaryColor,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
