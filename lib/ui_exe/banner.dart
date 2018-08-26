import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef void OnBannerClickListener(int index, dynamic itemData);
typedef Widget BuildShowView(int index, dynamic itemData);
typedef void onBannerPosition(int position);

const IntegerMax = 0x7fffffff;

class BannerView extends StatefulWidget {
  final OnBannerClickListener onBannerClickListener;

  //延迟多少秒进入下一页
  final int delayTime; //秒
  //滑动需要秒数
  final int scrollTime; //毫秒
  final double height;
  final List data;
  final BuildShowView buildShowView;
  final onBannerPosition bannerPosition;

  BannerView(
      {Key key,
      @required this.data,
      @required this.buildShowView,
      this.bannerPosition,
      this.onBannerClickListener,
      this.delayTime = 3,
      this.scrollTime = 200,
      this.height = 200.0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new BannerViewState();
}

class BannerViewState extends State<BannerView> {
//  double.infinity
  final pageController = new PageController(initialPage: IntegerMax ~/ 2);
  Timer timer;

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  resetTimer() {
    clearTimer();
    timer = new Timer.periodic(new Duration(seconds: widget.delayTime),
        (Timer timer) {
      if (pageController.positions.isNotEmpty) {
        var i = pageController.page.toInt() + 1;
        pageController.animateToPage(i,
            duration: new Duration(milliseconds: widget.scrollTime),
            curve: Curves.linear);
      }
    });
  }

  clearTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQueryData.fromWindow(ui.window).size.width;
    return new SizedBox(
        width: screenWidth,
        height: widget.height,
        child: widget.data.length == 0
            ? null
            : new GestureDetector(
                onTap: () {
                  if (widget.onBannerClickListener != null) {
                    widget.onBannerClickListener(
                        pageController.page.round() % widget.data.length,
                        widget.data[
                            pageController.page.round() % widget.data.length]);
                  }
                },
                onTapDown: (details) {
                  clearTimer();
                },
                onTapUp: (details) {
                  resetTimer();
                },
                onTapCancel: () {
                  resetTimer();
                },
                child: new PageView.builder(
                  controller: pageController,
                  physics:
                      const PageScrollPhysics(parent: const ScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return widget.buildShowView(
                        index, widget.data[index % widget.data.length]);
                  },
                  itemCount: IntegerMax,
                  onPageChanged: (int position) {
                    if (widget.bannerPosition != null) {
                      widget.bannerPosition(position);
                    }
                  },
                ),
              ));
  }

  @override
  void dispose() {
    clearTimer();
    super.dispose();
  }
}
