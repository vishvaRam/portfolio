import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Sections/Nav%20Bar/DesktopNavBar.dart';
import 'package:portfolio/Sections/Nav%20Bar/TabNavBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Constants/Constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.screenSize,
    @required this.itemScrollController,
  }) : super(key: key);

  final Size screenSize;
  final ItemScrollController itemScrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      color: kGrayBackground,
      child: MaxWidth(
          child: ResponsiveLayoutBuilder(
            mobile: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: kGrayBackground,
              title: FittedBox(
                child: Text(
                  "Back Bench Developers",
                  style: TextStyle(color: kYellowColor, fontSize: 22),
                ),
              ),
              leading: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            tablet: Container(),
            desktop: Container(),
          )),
    );
  }
}
