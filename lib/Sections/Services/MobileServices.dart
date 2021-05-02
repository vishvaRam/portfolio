import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';

class MobileServices extends StatefulWidget {

  const MobileServices({
    Key key,
  }) : super(key: key);

  @override
  _MobileServicesState createState() => _MobileServicesState();
}

class _MobileServicesState extends State<MobileServices> with SingleTickerProviderStateMixin{
  AnimationController animationController ;


  @override
  void initState() {
    animationController= AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    Timer(Duration(milliseconds: 200),()=>    animationController.forward());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    kIsWeb?print("false in web") :print("false in web");
    return MaxWidth(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: SectionTitle(
                      title: "Services",
                      fontSize: 28,
                      lineHeight: 5,
                    ),
                  ),
                  Container(
                    child: SectionSubTitle(
                      subTitle:
                      "Your dream to reality. In any platform you want!",
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset(0,0.3),end: Offset.zero,).animate(animationController),
                        child: FadeTransition(
                          opacity: animationController,
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width / 2,
                                    // height:
                                    // MediaQuery.of(context).size.height / 2,
                                    child:kIsWeb ? Image.network( "Assets/Images/Mobile.svg"):SvgPicture.asset(
                                      "Images/Mobile.svg",
                                      fit: BoxFit.contain,
                                      placeholderBuilder: (BuildContext context) => Container(
                                          padding: const EdgeInsets.all(30.0),
                                          child: const CircularProgressIndicator()),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          "Mobile App Development",
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                              color: kYellowColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          "We are building beautiful, natively compiled applications\nfor Android and IOS mobiles. Expressive and Flexible UI.\nNative Performance.",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset(0,0.3),end: Offset.zero,).animate(animationController),
                        child: FadeTransition(
                          opacity: animationController,
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: kIsWeb ? Image.network( "Assets/Images/Web.svg"):SvgPicture.asset(
                                      "Images/Web.svg",
                                      fit: BoxFit.contain,
                                      placeholderBuilder: (BuildContext context) => Container(
                                          padding: const EdgeInsets.all(30.0),
                                          child: const CircularProgressIndicator()),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          "Web Development",
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                              color: kYellowColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          "A Progressive Web Application built with Flutter.\nFlutter’s web support enables complex\nstandalone web apps that are rich with graphics\nand interactive content to reach end users on\na wide variety of devices.",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
