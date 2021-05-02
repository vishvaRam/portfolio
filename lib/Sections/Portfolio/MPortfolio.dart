import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Portfolio.dart';

class MobilePortfolio extends StatefulWidget {
  const MobilePortfolio({
    Key key,
    @required this.imagePaths,
    @required this.titles,
    @required this.subTitle,
    @required this.devicePlatform,
  }) : super(key: key);

  final List<List<String>> imagePaths;
  final List<String> titles;
  final List<String> subTitle;
  final List<platform> devicePlatform;

  @override
  _MobilePortfolioState createState() => _MobilePortfolioState();
}

class _MobilePortfolioState extends State<MobilePortfolio> {
  List<String> urls = [
    "https://play.google.com/store/apps/details?id=com.vishva.pdf.converter.plus&hl=en&gl=US",
    "https://play.google.com/store/apps/details?id=com.vishva.status.saver.plus&hl=en&gl=US",
    "https://play.google.com/store/apps/details?id=vishva.of.messager.bunker&hl=en&gl=US",
    "https://play.google.com/store/apps/details?id=com.vishva.internet.speed.tester.internetspeedtest&hl=en&gl=US"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: SectionTitle(
                      title: "Portfolio",
                      fontSize: 28,
                      lineHeight: 5,
                    ),
                  ),
                  Container(
                    child: SectionSubTitle(
                      subTitle: "Some of our best creative works",
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 3 / 3,
                  enlargeCenterPage: true,
                ),
                items: [
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(urls[0])) {
                        await launch(urls[0]);
                      } else {
                        throw 'Could not launch ${urls[0]}';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPortfolioCard,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.imagePaths[0][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        widget.titles[0],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: kYellowColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        widget.subTitle[0],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: widget.devicePlatform[0] == platform.Android
                                ? Image.asset(
                                    "Assets/Images/banner.png",
                                    fit: BoxFit.contain,
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(urls[1])) {
                        await launch(urls[1]);
                      } else {
                        throw 'Could not launch ${urls[1]}';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPortfolioCard,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.imagePaths[1][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        widget.titles[1],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: kYellowColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        widget.subTitle[1],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: widget.devicePlatform[1] == platform.Android
                                ? Image.asset(
                                    "Assets/Images/banner.png",
                                    fit: BoxFit.contain,
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(urls[2])) {
                        await launch(urls[2]);
                      } else {
                        throw 'Could not launch ${urls[2]}';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPortfolioCard,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.imagePaths[2][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        widget.titles[2],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: kYellowColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        widget.subTitle[2],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: widget.devicePlatform[2] == platform.Android
                                ? Image.asset(
                                    "Assets/Images/banner.png",
                                    fit: BoxFit.contain,
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(urls[3])) {
                        await launch(urls[3]);
                      } else {
                        throw 'Could not launch ${urls[3]}';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPortfolioCard,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.imagePaths[3][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        widget.titles[3],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: kYellowColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        widget.subTitle[3],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: widget.devicePlatform[3] == platform.Android
                                ? Image.asset(
                                    "Assets/Images/banner.png",
                                    fit: BoxFit.contain,
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
