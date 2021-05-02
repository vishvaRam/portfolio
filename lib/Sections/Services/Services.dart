import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Sections/Services/DesktopServices.dart';
import 'package:portfolio/Sections/Services/MobileServices.dart';
import 'package:portfolio/Sections/Services/TabServices.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> with SingleTickerProviderStateMixin{

  var imageOfVishva;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    kIsWeb?print("true in web") :print("false in web");

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: screenSize.height * 1.5 + 100,
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



