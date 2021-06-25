import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabletLandingPage extends StatefulWidget {
  const TabletLandingPage({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  final ItemScrollController scrollController;

  @override
  _TabletLandingPageState createState() => _TabletLandingPageState();
}

class _TabletLandingPageState extends State<TabletLandingPage>
  {
  var imageOfVishva;



  imagesetter(BuildContext context,BoxFit boxFit) {
    return imageOfVishva = Image.asset(
      "Assets/Images/back-bench-developers-flutter-developers.jpg",
      fit: boxFit,
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kNavBarHeightMobile,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kGrayBackground,
      child: MaxWidth(
        child: LayoutBuilder(builder: (context, constrain) {
          if(constrain.maxWidth <1126){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8),
                              child: FittedBox(
                                child: Text(
                                  "I'm Vishva",
                                  style: TextStyle(
                                      fontSize: 110,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: FittedBox(
                                child: Text(
                                  "Freelance Web & Mobile\nApp Developer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 32,
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
                                        style: TextStyle(
                                            fontSize: 24, color: kGrayBackground),
                                      )),
                                ),
                                color: kYellowColor,
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 6, child: Container(child: imagesetter(context,BoxFit.cover)))
                ],
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8),
                              child: FittedBox(
                                child: Text(
                                  "I'm Vishva",
                                  style: TextStyle(
                                      fontSize: 110,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: FittedBox(
                                child: Text(
                                  "Freelance Web & Mobile\nApp Developer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 32,
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
                                        style: TextStyle(
                                            fontSize: 24, color: kGrayBackground),
                                      )),
                                ),
                                color: kYellowColor,
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 6, child: Container(child: imagesetter(context,BoxFit.contain)))
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
