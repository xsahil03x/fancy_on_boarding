import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:fancy_on_boarding/page_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fancy OnBoarding Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Fancy OnBoarding HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageList = [
    new PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/hotels.png',
        title: new Text(
          'Hotels',
          style: new TextStyle(
            color: Colors.white,
            fontFamily: 'FlamanteRoma',
            fontSize: 34.0,
          ),
        ),
        body: new Text(
          'All hotels and hostels are sorted by hospitality rating',
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        iconAssetPath: 'assets/key.png'),
    new PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/banks.png',
        title: new Text(
          'Banks',
          style: new TextStyle(
            color: Colors.white,
            fontFamily: 'FlamanteRoma',
            fontSize: 34.0,
          ),
        ),
        body: new Text(
          'We carefully verify all banks before adding them into the app',
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        iconAssetPath: 'assets/wallet.png'),
    new PageModel(
      color: Colors.deepOrange,
      heroAssetPath: 'assets/stores.png',
      title: new Text(
        'Store',
        style: new TextStyle(
          color: Colors.white,
          fontFamily: 'FlamanteRoma',
          fontSize: 34.0,
        ),
      ),
      body: new Text(
        'All local stores are categorized for your convenience',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      iconAssetPath: 'assets/shopping_cart.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FancyOnBoarding(
      pageList: pageList,
    ));
  }
}
