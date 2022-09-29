library fancy_on_boarding;

import 'dart:async';
import 'system_language_code/system_language_code.dart'
    if (dart.library.html) 'system_language_code/system_language_code_web.dart';

import 'package:fancy_on_boarding/src/fancy_page.dart';
import 'package:fancy_on_boarding/src/page_dragger.dart';
import 'package:fancy_on_boarding/src/page_model.dart';
import 'package:fancy_on_boarding/src/page_reveal.dart';
import 'package:fancy_on_boarding/src/pager_indicator.dart';
import 'package:flutter/material.dart';

class FancyOnBoarding extends StatefulWidget {
  final List<PageModel> pageList;

  final VoidCallback onDoneButtonPressed;
  final VoidCallback? onSkipButtonPressed;
  final String doneButtonText;
  final OutlinedBorder? doneButtonShape;
  final TextStyle? doneButtonTextStyle;
  final Color? doneButtonBackgroundColor;
  final String skipButtonText;
  final TextStyle? skipButtonTextStyle;
  final Color? skipButtonColor;
  final bool showSkipButton;
  final double bottomMargin;
  final Widget? doneButton;
  final Widget? skipButton;

  FancyOnBoarding({
    Key? key,
    required this.pageList,
    required this.onDoneButtonPressed,
    this.onSkipButtonPressed,
    this.doneButtonText = "Done",
    this.doneButtonShape,
    this.doneButtonTextStyle,
    this.doneButtonBackgroundColor,
    this.skipButtonText = "Skip",
    this.skipButtonTextStyle,
    this.skipButtonColor,
    this.showSkipButton = true,
    this.bottomMargin = 8.0,
    this.doneButton,
    this.skipButton,
  })  : assert(pageList.length != 0),
        super(key: key);

  @override
  _FancyOnBoardingState createState() => _FancyOnBoardingState();
}

class _FancyOnBoardingState extends State<FancyOnBoarding>
    with TickerProviderStateMixin {
  final slideUpdateStream = StreamController<SlideUpdate>();
  late AnimatedPageDragger animatedPageDragger;
  late final List<PageModel> pageList = widget.pageList;
  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  bool get isRTL => systemLanguageCode.toLowerCase() == "ar";

  @override
  void initState() {
    super.initState();
    _listenSlideUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FancyPage(
          model: pageList[activeIndex],
          percentVisible: 1.0,
        ),
        PageReveal(
          revealPercent: slidePercent,
          child: FancyPage(
            model: pageList[nextPageIndex],
            percentVisible: slidePercent,
          ),
        ),
        Positioned(
          bottom: widget.bottomMargin,
          child: PagerIndicator(
            isRtl: isRTL,
            viewModel: PagerIndicatorViewModel(
              pageList,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
          ),
        ),
        PageDragger(
          pageLength: pageList.length - 1,
          currentIndex: activeIndex,
          canDragLeftToRight: activeIndex > 0,
          canDragRightToLeft: activeIndex < pageList.length - 1,
          onSlideUpdate: slideUpdateStream.add,
        ),
        PositionedDirectional(
          bottom: widget.bottomMargin,
          end: 8,
          child: Opacity(
            opacity: opacity,
            child: widget.doneButton ??
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      widget.doneButtonShape ??
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      widget.doneButtonBackgroundColor ??
                          const Color(0x88FFFFFF),
                    ),
                  ),
                  child: Text(
                    widget.doneButtonText,
                    style: widget.doneButtonTextStyle ??
                        const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800),
                  ),
                  onPressed:
                      opacity == 1.0 ? widget.onDoneButtonPressed : null,
                ),
          ),
        ),
        widget.showSkipButton
            ? Positioned(
                top: MediaQuery.of(context).padding.top,
                right: isRTL ? null : 0,
                left: isRTL ? 0 : null,
                child: widget.skipButton ??
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: widget.skipButtonColor != null
                            ? MaterialStateProperty.all<Color>(
                                widget.doneButtonBackgroundColor!)
                            : null,
                      ),
                      child: Text(
                        widget.skipButtonText,
                        style: widget.skipButtonTextStyle ??
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      onPressed: widget.onSkipButtonPressed,
                    ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  _listenSlideUpdate() {
    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              onSlideUpdate: slideUpdateStream.add,
              vsync: this,
            );
          } else {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              onSlideUpdate: slideUpdateStream.add,
              vsync: this,
            );
            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {
          activeIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  double get opacity {
    if (pageList.length - 2 == activeIndex &&
        slideDirection == SlideDirection.rightToLeft) return slidePercent;
    if (pageList.length - 1 == activeIndex &&
        slideDirection == SlideDirection.leftToRight) return 1 - slidePercent;
    if (pageList.length - 1 == activeIndex) return 1.0;
    return 0.0;
  }

  @override
  void dispose() {
    slideUpdateStream.close();
    super.dispose();
  }
}
