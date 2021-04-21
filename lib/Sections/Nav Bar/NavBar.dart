import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Sections/Nav%20Bar/DesktopNavBar.dart';
import 'package:portfolio/Sections/Nav%20Bar/MobileNavBar.dart';
import 'package:portfolio/Sections/Nav%20Bar/TabNavBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavBar extends StatefulWidget {
  final ItemScrollController scrollController;

  const NavBar({Key key, this.scrollController}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: Container(),
      tablet: TabNavBar(scrollController: widget.scrollController,),
      desktop: DesktopNavBar(scrollController: widget.scrollController,),
    );
  }
}

