import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';


class TabServices extends StatelessWidget {
  const TabServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaxWidth(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SectionTitle(
                    title: "Services",
                    fontSize: 38,
                    lineHeight: 6,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SectionSubTitle(
                    subTitle:
                    "Your dream to reality. In any platform you want!",
                    fontSize: 28,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height:
                                MediaQuery.of(context).size.height / 2,
                                child: Image.asset( "Assets/Images/Mobile.png",fit: BoxFit.contain)
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "Mobile App Development",
                                      style: TextStyle(
                                          fontSize: 46,
                                          fontWeight: FontWeight.w500,
                                          color: kYellowColor),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FittedBox(
                                    child: Text(
                                        "We are building beautiful, natively compiled applications\nfor Android and IOS mobiles. Expressive and Flexible UI.\nNative Performance.",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        "Web development",
                                        style: TextStyle(
                                            fontSize: 46,
                                            fontWeight: FontWeight.w500,
                                            color: kYellowColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FittedBox(
                                      child: Text(
                                          "A Progressive Web Application built with Flutter.\nFlutter’s web support enables complex\nstandalone web apps that are rich with graphics\nand interactive content to reach end users on\na wide variety of devices.",
                                          style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Image.asset( "Assets/Images/web.png",fit: BoxFit.contain,)
                              ),
                            ),
                          ],
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
