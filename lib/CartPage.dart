import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, int> products = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/cart'));

    if (response.statusCode == 200) {
      setState(() {
        print(response.body);
        products = Map<String, int>.from(json.decode(response.body));
        print("somthind so i can know 5555555555555555555");
        print(products);
      });
    } else {
      // Handle error
      print('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text('Cart'),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final productId = products.keys.elementAt(index);
                final quantity = products.values.elementAt(index);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(productId.substring(0, 2)), // Just for demonstration
                  ),
                  title: Text('Product ID: $productId'),
                  subtitle: Text('Quantity: $quantity'),
                );
              },
            ),
    );
  }
}

