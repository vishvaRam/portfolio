import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:portfolio/Custom_Widgets/SubTitle.dart';
import 'package:portfolio/Sections/Services/DesktopServices.dart';
import 'package:portfolio/Sections/Services/MobileServices.dart';
import 'package:portfolio/Sections/Services/TabServices.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: screenSize.height * 1.5,
      width: screenSize.width,
      color: kDarkGreyColor,
      child: ResponsiveLayoutBuilder(
        mobile:MobileServices(),
        tablet: TabServices(),
        desktop: DesktopServices(),
      ),
    );
  }
}



