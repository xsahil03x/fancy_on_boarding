import 'package:fancy_on_boarding/page_model.dart';
import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final PageModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.INFINITY,
        color: viewModel.color,
        child:  Opacity(
          opacity: percentVisible,
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Transform(
                  transform: Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child:  Padding(
                    padding:  EdgeInsets.only(bottom: 25.0),
                    child:  Image.asset(viewModel.heroAssetPath,
                        width: 200.0, height: 200.0),
                  ),
                ),
                 Transform(
                  transform:  Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child:  Padding(
                      padding:  EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: viewModel.title),
                ),
                 Transform(
                  transform:  Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child:  Padding(
                      padding:  EdgeInsets.only(bottom: 75.0),
                      child: viewModel.body),
                ),
              ]),
        ));
  }
}
