import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DesktopLandingPage extends StatefulWidget {
  final ItemScrollController scrollController;

  const DesktopLandingPage({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  _DesktopLandingPageState createState() => _DesktopLandingPageState();
}

class _DesktopLandingPageState extends State<DesktopLandingPage> {
  var imageOfVishva;

  imagesetter(BuildContext context) {
    return imageOfVishva = Image.asset(
      "Assets/Images/back-bench-developers-flutter-developers.jpg",
      fit: BoxFit.fitHeight,
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  @override
  void didChangeDependencies() {
    imagesetter(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kNavBarHeightMobile,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kGrayBackground,
      child: MaxWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 500),
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 500),
                      slidingCurve: Curves.easeInOut,
                      slidingBeginOffset: Offset(0, 0.2),
                      child: buildLandingText(context))),
              Expanded(
                  flex: 6,
                  child: DelayedDisplay(
                      delay: Duration(milliseconds: 500),
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 500),
                      slidingCurve: Curves.easeInOut,
                      slidingBeginOffset: Offset(0, 0.2),
                      child: buildImage(context)))
            ],
          ),
        ),
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: imageOfVishva);
  }

  Container buildLandingText(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            child: FittedBox(
              child: Text(
                "I'm Vishva",
                style: TextStyle(
                    fontSize: 170,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: FittedBox(
              child: Text(
                "Freelance Web & Mobile \nApp Developer",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 46,
                    color: Colors.white70),
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FlatButton(
              onPressed: () {
                widget.scrollController.scrollTo(
                    index: 4,
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 900));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                    child: Text(
                  "Hire me",
                  style: TextStyle(fontSize: 28, color: kGrayBackground),
                )),
              ),
              color: kYellowColor,
            ),
          )
        ],
      ),
    );
  }
}
