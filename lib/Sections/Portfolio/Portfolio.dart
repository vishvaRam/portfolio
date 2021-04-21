import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

enum platform { Android, Web, IOS }

class _PortfolioState extends State<Portfolio> {
  List<String> titles = [
    "PDF Converter Plus",
    "Status Saver Plus",
    "Attendance Tracker",
    "Internet  Speed Tester"
  ];
  List<String> subTitle = [
    "An Android app to convert Image \ninto PDF file.",
    "Download and share your friend's\nstatus from WhatsApp.",
    "Maintain your college/University\nattendance effectively.",
    "Check your InternetSpeed and Ping."
  ];

  List<List<String>> imagePaths = [
    ["Assets/Images/pdf 1.png", "Assets/Images/pdf 2.png"],
    ["Assets/Images/home.png", "Assets/Images/image.png"],
    ["Assets/Images/light mode.png", "Assets/Images/Day attendence.png"],
    ["Assets/Images/speed 1.png", "Assets/Images/speed 2.png"]
  ];

  List<platform> devicePlatform = [
    platform.Android,
    platform.Android,
    platform.Android,
    platform.Android
  ];

  final ItemScrollController cardScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      color: kPortfolioBG,
      child: ResponsiveLayoutBuilder(
        mobile: Container(),
        tablet: Container(),
        desktop: MaxWidth(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: SectionTitle(
                            title: "Portfolio",
                            fontSize: 38,
                            lineHeight: 6,
                          ),
                        ),
                        Expanded(
                          child: SectionSubTitle(
                            subTitle: "Some of our best creative works",
                            fontSize: 28,
                          ),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      cardScrollController.scrollTo(
                          index: titles.length,
                          curve: Curves.easeInOutCubic,
                          duration: Duration(milliseconds: 800));
                    },
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: kYellowColor,
                      size: 32,
                    ),
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: Container(
                        height: screenSize.height / 6,
                        width: screenSize.width,
                        child: ScrollablePositionedList.builder(
                            itemScrollController: cardScrollController,
                            itemCount: titles.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 20, right: 50, left: 50, bottom: 50),
                                width: screenSize.width / 5,
                                decoration: BoxDecoration(
                                    color: kPortfolioCard,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 8,
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white10,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: ClipRRect(
                                                  child: Image.asset(
                                                    imagePaths[index][0],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Image.asset(
                                                  imagePaths[index][1],
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  titles[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: kYellowColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  subTitle[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: devicePlatform[index] ==
                                              platform.Android
                                          ? Image.asset(
                                              "Assets/Images/banner.png",
                                              fit: BoxFit.contain,
                                            )
                                          : Container(),
                                    )
                                  ],
                                ),
                              );
                            }))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
