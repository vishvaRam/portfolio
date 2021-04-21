import 'package:flutter/material.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Sections/Landing Page/DesktopLandingPage.dart';
import 'package:portfolio/Sections/Landing Page/TabletLandingPage.dart';
import 'package:portfolio/Sections/Landing Page/MobileLandingPage.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class LandingPage extends StatefulWidget {
  final ItemScrollController scrollController;

  const LandingPage({Key key, this.scrollController}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobile: MobileLandingPage( scrollController: widget.scrollController,),
      tablet: TabletLandingPage(scrollController: widget.scrollController,),
      desktop: DesktopLandingPage(scrollController: widget.scrollController,),
    );
  }
}



