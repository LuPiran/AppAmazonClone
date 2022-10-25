import 'package:amazon_app/utils/utils.dart';
import 'package:amazon_app/widget/banner_ad_widget.dart';
import 'package:amazon_app/widget/categories_horizontal_list_view_bar.dart';
import 'package:amazon_app/widget/products_showcase_list_view.dart';
import 'package:amazon_app/widget/search_bar_widget.dart';
import 'package:amazon_app/widget/simple_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> testChildren = [
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesHorizontalListViewBar(),
            BannerAdWidget(),
            ProductsShowcaseListView(
              title: "Até 70% de desconto",
              children: testChildren,
            ),
            ProductsShowcaseListView(
              title: "Até 60% de desconto",
              children: testChildren,
            ),
            ProductsShowcaseListView(
              title: "Até 50% de desconto",
              children: testChildren,
            ),
            ProductsShowcaseListView(
              title: "Explorar",
              children: testChildren,
            ),
          ],
        ),
      ),
    );
  }
}
