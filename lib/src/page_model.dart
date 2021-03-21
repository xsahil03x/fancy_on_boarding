import 'package:flutter/material.dart';

class PageModel {
  final Color color;
  final String heroImagePath;
  final Color? heroImageColor;
  final Widget title;
  final Widget body;
  final String? iconImagePath;
  final Icon? icon;

  PageModel({
    required this.title,
    required this.body,
    required this.color,
    required this.heroImagePath,
    this.heroImageColor,
    this.iconImagePath,
    this.icon,
  })  : assert(
          iconImagePath != null || icon != null,
          'Provide at least icon or iconImagePath',
        ),
        assert(
          (iconImagePath != null && icon == null) ||
              (iconImagePath == null && icon != null),
          'Cannot provide both icon, iconImagePath',
        );
}
