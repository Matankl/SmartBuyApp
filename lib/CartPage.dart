// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Product.dart';
// import 'SearchPage.dart';
// import 'CartPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more items when reaching the bottom
      setState(() {
        items.addAll(List.generate(10, (index) => 'Item ${items.length + index}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items
            .map(
              (item) => ListTile(
                title: Text(item),
              ),
            )
            .toList(),
      ),
    );
  }
}