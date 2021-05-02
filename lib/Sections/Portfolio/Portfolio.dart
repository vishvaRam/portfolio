import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'DesktopPortfolio.dart';
import 'TabPortfolio.dart';
import 'MPortfolio.dart';

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
    ["Assets/Images/pdf.png"],
    ["Assets/Images/ss.png"],
    ["Assets/Images/at.png"],
    ["Assets/Images/ist.png"]
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
      height: screenSize.width< kTabletBreakPoint ? screenSize.height/1.2 : screenSize.height ,
      color: kPortfolioBG,
      child: ResponsiveLayoutBuilder(
        mobile: MobilePortfolio(imagePaths: imagePaths, titles: titles, subTitle: subTitle, devicePlatform: devicePlatform),
        tablet: TabPortfolio(cardScrollController: cardScrollController, titles: titles, screenSize: screenSize, imagePaths: imagePaths, subTitle: subTitle, devicePlatform: devicePlatform),
        desktop: DesktopPortfolio(cardScrollController: cardScrollController, titles: titles, screenSize: screenSize, imagePaths: imagePaths, subTitle: subTitle, devicePlatform: devicePlatform),
      ),
    );
  }
}
