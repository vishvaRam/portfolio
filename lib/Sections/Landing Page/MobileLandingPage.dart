import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MobileLandingPage extends StatefulWidget {
  final ItemScrollController scrollController;

  const MobileLandingPage({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  _MobileLandingPageState createState() => _MobileLandingPageState();
}

class _MobileLandingPageState extends State<MobileLandingPage> {
  var imageOfVishva;



  imagesetter(BuildContext context,BoxFit fit) {
    return imageOfVishva = Center(
      child: Image.asset(
        "Assets/Images/back-bench-developers-flutter-developers.jpg",
        fit: fit,
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kNavBarHeightMobile,
      color: kGrayBackground,
      child: MaxWidth(
        child: LayoutBuilder(
          builder:(context,constrains){
            if(constrains.maxWidth < 1124){
              return DelayedDisplay(delay: Duration(milliseconds: 500),
                  fadeIn: true,
                  fadingDuration: Duration(milliseconds: 500),
                  slidingCurve: Curves.easeInOut,
                  slidingBeginOffset: Offset(0,0.2),child:  buildForSmall(context));
            }
            else{
              return DelayedDisplay(delay: Duration(milliseconds: 500),
                  fadeIn: true,
                  fadingDuration: Duration(milliseconds: 500),
                  slidingCurve: Curves.easeInOut,
                  slidingBeginOffset: Offset(0,0.2),child: buildForAll(context));
            }
          }
        ),
      ),
    );
  }

  Column buildForAll(BuildContext context) {
    return Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Container(
                  // flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 2),
                            child: FittedBox(
                              child: Text(
                                "I'm Vishva",
                                style: TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0,right: 15.0, top: 0,bottom: 5),
                          child: FittedBox(
                            child: Text(
                              "Freelance Web & Mobile\nApp Developer",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white70),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FlatButton(
                          onPressed: () {
                            widget.scrollController.scrollTo(
                                index: 4,
                                curve: Curves.easeInOutCubic,
                                duration: Duration(milliseconds: 900));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Hire me",
                              style: TextStyle(
                                  fontSize: 18, color: kGrayBackground),
                            ),
                          ),
                          color: kYellowColor,
                        )
                      ],
                    )),
                Expanded(flex: 7, child: Container(child: imagesetter(context, BoxFit.fitHeight)))
              ],
            );
  }

  Column buildForSmall(BuildContext context) {
    return buildForAll(context);
  }
}
