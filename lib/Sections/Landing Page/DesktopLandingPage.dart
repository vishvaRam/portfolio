import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DesktopLandingPage extends StatelessWidget {
  final ItemScrollController scrollController;

  const DesktopLandingPage({
    Key key, this.scrollController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kNavBarHeightMobile,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kGrayBackground,
      child: MaxWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 8),
                          child: FittedBox(
                            child: Text(
                              "I'm Vishva",
                              style: TextStyle(
                                  fontSize: 170,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8),
                          child: FittedBox(
                            child: Text(
                              "Freelance Web & Mobile \nApp Developer",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 46,
                                  color: Colors.white70),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: FlatButton(
                            onPressed: () {
                              scrollController.scrollTo(
                                  index: 3,
                                  curve: Curves.easeInOutCubic,
                                  duration: Duration(milliseconds: 400));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                  child: Text(
                                    "Hire me",
                                    style: TextStyle(
                                        fontSize: 28, color: kGrayBackground),
                                  )),
                            ),
                            color: kYellowColor,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "Assets/Images/vishva.png",
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.height,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
