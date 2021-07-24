import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/search_product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_spinkit_button.dart';
import 'package:shamo/widgets/new_arrival_card.dart';

class SearchPage extends StatelessWidget {
  final String searchQuery;
  final bool isCategory;
  final String categoryName;
  SearchPage(
    this.searchQuery, {
    this.isCategory = false,
    this.categoryName = '',
  });

  Widget build(BuildContext context) {
    SearchProductProvider searchProductProvider =
        Provider.of<SearchProductProvider>(context);

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
                          fontSize: 16,
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
              categoryName != ''
                  ? categoryName + ' Category Shoes'
                  : searchQuery,
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
          children: searchProductProvider.products
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
      body: FutureBuilder(
        future: isCategory
            ? searchProductProvider
                .getProductsByCategory(int.parse(searchQuery))
            : searchProductProvider.getProductsByName(searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingButtonSpinkit();
          } else {
            return Container(
              margin: EdgeInsets.all(defaultMargin),
              child: (searchProductProvider.products.isNotEmpty)
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header(),
                          products(),
                        ],
                      ))
                  : Center(
                      child: Text(
                        'Oopps!\nNo Products Found',
                        textAlign: TextAlign.center,
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
            );
          }
        },
      ),
    );
  }
}
