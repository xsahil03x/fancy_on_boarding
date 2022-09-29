import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FancyImage extends StatelessWidget {
  const FancyImage({
    Key? key,
    required this.image,
    this.width = 24,
    this.height = 24,
    this.color = Colors.white,
  }) : super(key: key);

  final String image;
  final double width;
  final double height;
  final Color? color;

  bool get isUrl => Uri.parse(image).isAbsolute;

  bool get isSvg => image.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (isUrl)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: isSvg
            ? SvgPicture.asset(
                image,
                width: width,
                height: height,
                color: color,
                fit: BoxFit.contain,
              )
            : Image.network(
                image,
                width: width,
                height: height,
                color: color,
                fit: BoxFit.contain,
              ),
      );
    if (isSvg)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          image,
          width: width,
          height: height,
          color: color,
          fit: BoxFit.contain,
        ),
      );
    return Image.asset(
      image,
      color: color,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
