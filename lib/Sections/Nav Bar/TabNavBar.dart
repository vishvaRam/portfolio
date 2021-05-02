import 'package:flutter/material.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:portfolio/Constants/Constants.dart';

class TabNavBar extends StatefulWidget {
  final ItemScrollController scrollController;
  TabNavBar({this.scrollController});
  @override
  _TabNavBarState createState() => _TabNavBarState();
}

class _TabNavBarState extends State<TabNavBar> {
  List<String> navItems = ["Services", "Portfolio", "Contact"];
  int selectedIndex;

  Widget buildNavItems(int index) {
    return InkWell(
      onHover: (value){
        print("Is Hovering: "+value.toString());
        if(value == true){
          setState(() {
            selectedIndex = index;
          });
        }else{
          setState(() {
            selectedIndex = null;
          });
        }
      },
      onTap: () {
        if (navItems[index] == "Services") {
          widget.scrollController.scrollTo(
              index: 2,
              duration: Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic);
          setState(() {
            selectedIndex = index;
          });

          Future.delayed(Duration(milliseconds: 500),(){
            setState(() {
              selectedIndex = null;
            });
          });

        } else if (navItems[index] == "Portfolio") {
          widget.scrollController.scrollTo(
              index: 3,
              duration: Duration(milliseconds: 900),
              curve: Curves.easeInOutCubic);
          setState(() {
            selectedIndex = index;
          });
          Future.delayed(Duration(milliseconds: 500),(){
            setState(() {
              selectedIndex = null;
            });
          });

        } else if (navItems[index] == "Contact") {
          widget.scrollController.scrollTo(
              index: 4,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutCubic);
          setState(() {
            selectedIndex = index;
          });
          Future.delayed(Duration(milliseconds: 500),(){
            setState(() {
              selectedIndex = null;
            });
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              navItems[index],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: selectedIndex == index ? 20 : 18,
                color:
                selectedIndex == index ? kYellowColor : knotSelectedText,
              ),
            ),
            Container(
              height: 4,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                selectedIndex == index ? kYellowColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kNavBarHeightTab,
      child: MaxWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:  const EdgeInsets.symmetric(horizontal:15.0),
              child: Text(
                "Back Bench Developers",
                style: TextStyle(fontSize: kLogoSize, color: kYellowColor,fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: Row(
                  children: [buildNavItems(0), buildNavItems(1), buildNavItems(2)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
