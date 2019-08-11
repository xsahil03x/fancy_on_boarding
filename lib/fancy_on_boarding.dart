library fancy_on_boarding;

import 'dart:async';
import 'package:fancy_on_boarding/page_dragger.dart';
import 'package:fancy_on_boarding/page_reveal.dart';
import 'package:fancy_on_boarding/page_model.dart';
import 'package:fancy_on_boarding/pager_indicator.dart';
import 'package:fancy_on_boarding/pages.dart';
import 'package:flutter/material.dart';

class FancyOnBoarding extends StatefulWidget {
  final List<PageModel> pageList;
  final String mainPageRoute;
  final String buttonText;

  FancyOnBoarding(
      {@required this.pageList,
      @required this.mainPageRoute,
      this.buttonText = "Done"})
      : assert(pageList.length != 0);

  @override
  _FancyOnBoardingState createState() =>
      _FancyOnBoardingState(pageList, mainPageRoute);
}

class _FancyOnBoardingState extends State<FancyOnBoarding>
    with TickerProviderStateMixin {
  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;

  List<PageModel> pageList;
  String mainPageRoute;
  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  _FancyOnBoardingState(List<PageModel> pageList, String mainPageRoute) {
    this.pageList = pageList;
    this.mainPageRoute = mainPageRoute;
    slideUpdateStream = StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          print('Sliding ${event.direction} at ${event.slidePercent}');
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
          print('Done dragging.');
          if (slidePercent > 0.5) {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.animating) {
          print('Sliding ${event.direction} at ${event.slidePercent}');
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {
          print('Done animating. Next page index: $nextPageIndex');
          activeIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Page(
          viewModel: pageList[activeIndex],
          percentVisible: 1.0,
        ),
        PageReveal(
          revealPercent: slidePercent,
          child: Page(
            viewModel: pageList[nextPageIndex],
            percentVisible: slidePercent,
          ),
        ),
        PagerIndicator(
          viewModel: PagerIndicatorViewModel(
            pageList,
            activeIndex,
            slideDirection,
            slidePercent,
          ),
        ),
        PageDragger(
          pageLength: pageList.length - 1,
          currentIndex: activeIndex,
          mainPageRoute: mainPageRoute,
          canDragLeftToRight: activeIndex > 0,
          canDragRightToLeft: activeIndex < pageList.length - 1,
          slideUpdateStream: this.slideUpdateStream,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Opacity(
            opacity: _getOpacity(),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: const Color(0x88FFFFFF),
              child: Text(
                widget.buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, widget.mainPageRoute),
            ),
          ),
        ),
        Positioned(
          top: 22,
          right: 0,
          child: FlatButton(
            child: Text(
              "Skip",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800),
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, widget.mainPageRoute),
          ),
        )
      ],
    );
  }

  double _getOpacity() {
    if(pageList.length-2 == activeIndex && slideDirection == SlideDirection.rightToLeft) return slidePercent;
    if(pageList.length-1 == activeIndex && slideDirection == SlideDirection.leftToRight) return 1-slidePercent;
    if(pageList.length-1 == activeIndex) return 1.0;
    return 0.0;
  }

  @override
  void dispose() {
    slideUpdateStream?.close();
    super.dispose();
  }
}
