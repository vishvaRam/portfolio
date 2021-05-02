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

class _MainAppState extends State<MainApp>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
    if (screenSize.width < kTabletBreakPoint) {
      appBarHeight = 60.0;
    } else if (screenSize.width >= kTabletBreakPoint &&
        screenSize.width < kDesktopBreakPoint) {
      appBarHeight = 70.0;
    } else {
      appBarHeight = 80.0;
    }
    return ResponsiveLayoutBuilder(
      mobile: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: screenSize.width < kTabletBreakPoint
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, appBarHeight),
                  child: AppBarWidget(
                    screenSize: screenSize,
                    itemScrollController: itemScrollController,
                    sacffoldKey: scaffoldKey,
                  ),
                )
              : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
          body: ResponsiveLayoutBuilder(
            mobile: Container(
              color: kGrayBackground,
              height: MediaQuery.of(context).size.height,
              child: ScrollablePositionedList.builder(
                itemCount: 5,
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
                itemCount: 5,
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
                itemCount: 5,
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
          drawer: screenSize.width < kTabletBreakPoint
              ? Container(
                  height: screenSize.height,
                  width: screenSize.width,
                  color: kDarkGreyColor,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Container(
                        height: screenSize.height/1.3,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenSize.width/2,
                              child: ListTile(
                                focusColor: kYellowColor,
                                title: FittedBox(
                                    child: Text(
                                  "Services",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                                onTap: () {
                                  itemScrollController.scrollTo(index: 2, duration: Duration(milliseconds: 900),curve: Curves.easeInOutCubic);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                              width: screenSize.width/2,
                              child: ListTile(
                                focusColor: kYellowColor,
                                title: FittedBox(
                                    child: Text(
                                  "Portfolio",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                                onTap: () {
                                  itemScrollController.scrollTo(index: 3, duration: Duration(milliseconds: 900),curve: Curves.easeInOutCubic);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                              width: screenSize.width/2,
                              child: ListTile(
                                focusColor: kYellowColor,
                                title: FittedBox(
                                    child: Text(
                                  "Contact",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                                onTap: () {
                                  itemScrollController.scrollTo(index: 5, duration: Duration(milliseconds: 900),curve: Curves.easeInOutCubic);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : null,
        ),
      ),
      desktop: SafeArea(
        child: Scaffold(
          appBar: screenSize.width < kTabletBreakPoint
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, appBarHeight),
                  child: AppBarWidget(
                      screenSize: screenSize,
                      itemScrollController: itemScrollController),
                )
              : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
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
                itemCount: 5,
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
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
