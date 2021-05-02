import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Portfolio.dart';

class TabPortfolio extends StatefulWidget {
  const TabPortfolio({
    Key key,
    @required this.cardScrollController,
    @required this.titles,
    @required this.screenSize,
    @required this.imagePaths,
    @required this.subTitle,
    @required this.devicePlatform,
  }) : super(key: key);

  final ItemScrollController cardScrollController;
  final List<String> titles;
  final Size screenSize;
  final List<List<String>> imagePaths;
  final List<String> subTitle;
  final List<platform> devicePlatform;

  @override
  _TabPortfolioState createState() => _TabPortfolioState();
}

class _TabPortfolioState extends State<TabPortfolio> {
  List<String> urls=["https://play.google.com/store/apps/details?id=com.vishva.pdf.converter.plus&hl=en&gl=US","https://play.google.com/store/apps/details?id=com.vishva.status.saver.plus&hl=en&gl=US","https://play.google.com/store/apps/details?id=vishva.of.messager.bunker&hl=en&gl=US","https://play.google.com/store/apps/details?id=com.vishva.internet.speed.tester.internetspeedtest&hl=en&gl=US"];

  @override
  Widget build(BuildContext context) {
    return MaxWidth(
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
                  widget.cardScrollController.scrollTo(
                      index: widget.titles.length,
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
                    height: widget.screenSize.height / 4,
                    width: widget.screenSize.width,
                    child: ScrollablePositionedList.builder(
                        itemScrollController: widget.cardScrollController,
                        itemCount: widget.titles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 6 / 5,
                            child: InkWell(
                              onTap: ()async{
                                if(await canLaunch(urls[index])){
                                  await launch(urls[index]);
                                }else{
                                  throw 'Could not launch ${urls[index]}';
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 20, right: 50, left: 50, bottom: 50),
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
                                              widget.imagePaths[index][0],
                                              fit: BoxFit.cover,
                                            ),
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
                                                  widget.titles[index],
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
                                                  widget.subTitle[index],
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
                                      child: widget.devicePlatform[index] ==
                                          platform.Android
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
                          );
                        }))),
          ],
        ),
      ),
    );
  }
}
