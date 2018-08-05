import 'package:flutter/material.dart';

class PageModel {
  final Color color;
  final String heroAssetPath;
  final Text title;
  final Text body;
  final String iconAssetPath;

  PageModel({
    @required this.color,
    @required this.heroAssetPath,
    this.title,
    this.body,
    @required this.iconAssetPath,
  })  : assert(title != null),
        assert(body != null),
        assert(color != null),
        assert(heroAssetPath != null),
        assert(iconAssetPath != null);
}
