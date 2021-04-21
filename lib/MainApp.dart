import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Pages.dart';
import 'package:portfolio/Sections/Nav%20Bar/MobileNavBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();



  bool menu = false;

  toggleMenu() {
    setState(() {
      menu = !menu;
    });

    print("Menu : " + menu.toString());
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight;
    var screenSize = MediaQuery.of(context).size;
    if(screenSize.width< kTabletBreakPoint){
      appBarHeight = 60.0;
    }else if(screenSize.width >= kTabletBreakPoint &&  screenSize.width< kDesktopBreakPoint){
      appBarHeight = 70.0;
    }else{
      appBarHeight = 80.0;
    }
    return SafeArea(
      child: Scaffold(
        appBar: screenSize.width < kTabletBreakPoint ? PreferredSize(
          preferredSize: Size(screenSize.width, appBarHeight),
          child:  AppBarWidget(screenSize: screenSize, itemScrollController: itemScrollController),
        ):PreferredSize(child: Container(), preferredSize: Size(0,0)),
        body: ResponsiveLayoutBuilder(
          mobile: Container(
            color: kGrayBackground,
            height: MediaQuery.of(context).size.height,
            child: ScrollablePositionedList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                print(index);
                return Pages(
                  index: index,
                  scrollController: itemScrollController,
                  menu: menu,
                  toggleMenu: toggleMenu,
                );
              },
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
            ),
          ),
          tablet: Container(
            color: kGrayBackground,
            height: MediaQuery.of(context).size.height,
            child: ScrollablePositionedList.builder(
              itemCount: 4,

              itemBuilder: (context, index) {
                print(index);
                return Pages(
                  index: index,
                  scrollController: itemScrollController,
                );
              },
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
            ),
          ),
          desktop: Container(
            color: kGrayBackground,
            height: MediaQuery.of(context).size.height,
            child: ScrollablePositionedList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                print(index);
                return Pages(
                  index: index,
                  scrollController: itemScrollController,
                );
              },
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
            ),
          ),
        ),
      ),
    );
  }
}


