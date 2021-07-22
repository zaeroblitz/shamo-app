import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/new_arrival_card.dart';

class SearchPage extends StatelessWidget {
  // List<ProductModel> products = [];
  // SearchPage(this.products);

  final String searchQuery;
  SearchPage(this.searchQuery);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    productProvider.getProductsByName(searchQuery);

    Widget appBar() {
      return PreferredSize(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: backgroundColor1,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )),
              title: Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 24,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        'Search Result',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(60),
      );
    }

    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Search Result For',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              searchQuery,
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget products() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productProvider.products
              .map((product) => NewArrialCard(
                    product: product,
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: appBar(),
      body: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              products(),
            ],
          ),
        ),
      ),
    );
  }
}
