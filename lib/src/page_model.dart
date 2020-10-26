import 'package:flutter/material.dart';

class PageModel {
  final Color color;
  final String heroImagePath;
  final Color heroImageColor;
  final Widget title;
  final Widget body;
  final String iconImagePath;
  final Icon icon;

  PageModel({
    @required this.color,
    @required this.heroImagePath,
    this.heroImageColor,
    this.title,
    this.body,
    this.iconImagePath,
    this.icon,
  })  : assert(title != null),
        assert(body != null),
        assert(color != null),
        assert(heroImagePath != null),
        assert(
            (iconImagePath != null && icon == null) ||
                (iconImagePath == null && icon != null),
            'Cannot provide both icon, iconImagePath');
}
