import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'second_screen.dart';

void mainLocalization() => runApp(EasyLocalization(
      child: MyLocalizationApp(),
      path: 'assets/langs',
      supportedLocales: MyLocalizationApp.list,
      useOnlyLangCode: true,
    ));

class MyLocalizationApp extends StatelessWidget {
  static const list = [Locale('en', 'US'), Locale('ar', 'TN')];

  @override
  Widget build(BuildContext context) {
    final windowLocale = ui.window.locale;
    Locale locale;
    try {
      final first = MyLocalizationApp.list
          ?.firstWhere((l) => l?.languageCode == windowLocale?.languageCode);
      locale = first != null ? first : Locale('en', 'US');
    } catch (e) {
      print(e);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //app-specific localization
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: locale,
      initialRoute: '/',
      //Add Route to the main Page.
      routes: {'/mainPage': (context) => MainPage()},
      title: 'Fancy OnBoarding Demo',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Nunito'),
      home: MyHomePage(title: 'Fancy OnBoarding HomePage'),
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
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/png/hotels.png',
        title: Text(tr("main.hotel_title"),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(tr("main.hotel_description"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/png/key.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/png/banks.png',
        title: Text(tr("main.bank_title"),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(tr("main.bank_description"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/png/wallet.png'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroAssetPath: 'assets/png/stores.png',
      title: Text(tr("main.store_title"),
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text(tr("main.store_description"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/png/shopping_cart.png',
    ),
    // SVG Pages Example
    PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: 'assets/svg/hotel.svg',
        title: Text('${tr("main.hotel_title")} SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(tr("main.hotel_description"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/svg/key.svg',
        heroAssetColor: Colors.white),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: 'assets/svg/bank.svg',
        title: Text('${tr("main.bank_title")} SVG',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(tr("main.bank_description"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/svg/cards.svg',
        heroAssetColor: Colors.white),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroAssetPath: 'assets/svg/store.svg',
      title: Text('${tr("main.store_title")} SVG',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text(tr("main.store_description"),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/svg/cart.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/mainPage'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/mainPage'),
      ),
    );
  }
}
