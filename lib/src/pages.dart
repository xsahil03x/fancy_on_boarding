import 'package:fancy_on_boarding/src/page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page extends StatelessWidget {
  final PageModel model;
  final double percentVisible;

  Page({
    this.model,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height:MediaQuery.of(context).size.height,
        color: model.color,
        child: Opacity(
          opacity: percentVisible,
          child: SingleChildScrollView( 
            padding: EdgeInsets.only(top:50),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: _renderImageAsset(model.heroAssetPath,
                    width: 200, height: 200, color: model.heroAssetColor),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: model.title),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 75.0), child: model.body),
            ),
          ])),
        ));
  }
}

Widget _renderImageAsset(String assetPath,
    {double width = 24, double height = 24, Color color}) {
  if (assetPath.toLowerCase().endsWith(".svg")) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      color: color,
    );
  } else {
    return Image.asset(
      assetPath,
      color: color,
      width: width,
      height: height,
    );
  }
}
