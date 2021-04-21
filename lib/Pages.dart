import 'package:flutter/material.dart';
import 'package:portfolio/Sections/Landing Page/LandingPage.dart';
import 'package:portfolio/Sections/Portfolio.dart';
import 'package:portfolio/Sections/Services/Services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:portfolio/Sections/Nav Bar/NavBar.dart';

class Pages extends StatefulWidget {
  final ItemScrollController scrollController;
  final int index;
  final bool menu;
  final Function toggleMenu;
  Pages({this.index, this.scrollController, this.menu, this.toggleMenu});
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return NavBar(scrollController: widget.scrollController,);
        break;
      case 1:
        return LandingPage(scrollController: widget.scrollController,);
        break;
      case 2:
        return Services();
        break;
      case 3:
        return Portfolio();
        break;
      // case 4:
      //   return Contact();
      //   break;
    }
    return Container();
  }
}
