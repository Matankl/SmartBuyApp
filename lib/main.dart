// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Product.dart';
import 'SearchPage.dart';
import 'CartPage.dart';
import 'OptionsPage.dart';
import 'HomePage.dart';
import 'Themes.dart';
import 'BarcodeScanPage.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: lightBlueTheme,
      darkTheme: darkPurpleTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //PageController is a class in Flutter that controls a PageView
  //_currentIndex says what is the current page
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_getPageTitle()), // Dynamically set the title by the page name
      ),
      body: PageView(
        //create a scrollable list of pages or screens.
        controller: _pageController, //Determines which page displayed
        onPageChanged: (index) {
          // callback is triggered whenever the user swipes to a different page
          setState(() {
            //update the _currentIndex. triggers a rebuild of the widget, updating the UI based on the new current index.
            _currentIndex = index;
          });
        },
        children: [
          // screen options
          HomePage(),
          CartPage(),
          SearchPage(),
          OptionsPage(),
          BarcodeScanPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          //row of screens
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, //placement, spaceing and color change by the status
          children: [
            // Home Page
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                _pageController.jumpToPage(0);
              },
              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            // Cart Page
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                _pageController.jumpToPage(1);
              },
              color: _currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            // Search Page
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
            // Options Page
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                _pageController.jumpToPage(3);
              },
              color: _currentIndex == 3 ? Colors.blue : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.camera),
              onPressed: () {
                _pageController.jumpToPage(4);
              },
              color: _currentIndex == 4 ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get the current page title
  String _getPageTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Home Page';
      case 1:
        return 'Cart Page';
      case 2:
        return 'Search Page';
      case 3:
        return 'Options Page';
      case 4:
        return 'Barcode Scan Page';
      default:
        return 'Flutter SPA App';
    }
  }
}

/*                                        MEGA TO DO LIST

  *make the photos to be saved in the chash 

  *make the serch to show the closest item first and not the first item who contain the letters searched 

  *manage the cash memory

  *add camera scan page

  *make a serch history and show it if noting is in the serch bar

  *add price range to all the products on serch (in a certin range)/ avarage price

   */
