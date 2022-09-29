import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: ()=>Navigator.of(context).pushReplacementNamed('/'),
          child: Text(
            "Go to Fancy OnBoarding",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
