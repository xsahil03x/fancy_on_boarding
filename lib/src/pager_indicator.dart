import 'dart:ui';

import 'package:fancy_on_boarding/src/page_model.dart';
import 'package:flutter/material.dart';

import 'fancy_image.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;
  final bool isRtl;

  PagerIndicator({
    required this.viewModel,
    required this.isRtl,
  });

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];

      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > viewModel.activeIndex ||
          (i == viewModel.activeIndex &&
              viewModel.slideDirection == SlideDirection.leftToRight);

      bubbles.add(
        PageBubble(
          viewModel: PageBubbleViewModel(
            iconAssetPath: page.iconImagePath,
            icon: page.icon,
            color: page.color,
            isHollow: isHollow,
            activePercent: percentActive,
          ),
        ),
      );
    }

    final bubbleWidth = 55.0;
    final width = MediaQuery.of(context).size.width / 2;
    var translation =
        width - (viewModel.activeIndex * bubbleWidth) - (bubbleWidth / 2);
    if (viewModel.slideDirection == SlideDirection.leftToRight) {
      translation += bubbleWidth * viewModel.slidePercent;
    } else if (viewModel.slideDirection == SlideDirection.rightToLeft) {
      translation -= bubbleWidth * viewModel.slidePercent;
    }

    return Transform(
      transform: Matrix4.translationValues(
          isRtl ? -translation : translation, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bubbles,
      ),
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PagerIndicatorViewModel {
  final List<PageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidePercent;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent,
  );
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  const PageBubble({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 65.0,
      child: Center(
        child: Container(
          width: lerpDouble(20.0, 45.0, viewModel.activePercent),
          height: lerpDouble(20.0, 45.0, viewModel.activePercent),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF)
                    .withAlpha((0x88 * viewModel.activePercent).round())
                : const Color(0x88FFFFFF),
            border: Border.all(
              color: viewModel.isHollow
                  ? const Color(0x88FFFFFF).withAlpha(
                      (0x88 * (1.0 - viewModel.activePercent)).round())
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
          child: Opacity(
            opacity: viewModel.activePercent,
            child: viewModel.icon != null
                ? viewModel.icon
                : FancyImage(
                    image: viewModel.iconAssetPath!,
                    color: viewModel.color,
                  ),
          ),
        ),
      ),
    );
  }
}

class PageBubbleViewModel {
  final String? iconAssetPath;
  final Icon? icon;
  final Color color;
  final bool isHollow;
  final double activePercent;

  const PageBubbleViewModel({
    required this.isHollow,
    required this.activePercent,
    required this.color,
    this.icon,
    this.iconAssetPath,
  })  : assert(
          iconAssetPath != null || icon != null,
          'Please provide at least icon or iconImagePath',
        ),
        assert(
          (iconAssetPath != null && icon == null) ||
              (iconAssetPath == null && icon != null),
          'Cannot provide both icon, iconImagePath',
        );
}
