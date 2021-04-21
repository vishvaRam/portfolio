import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';



class MobileLandingPage extends StatelessWidget {
  final ItemScrollController scrollController;

  const MobileLandingPage({
    Key key, this.scrollController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kNavBarHeightMobile,
      color: kGrayBackground,
      child: MaxWidth(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 2),
                        child: FittedBox(
                          child: Text(
                            "I'm Vishva",
                            style: TextStyle(
                                fontSize: 72,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
                      child: FittedBox(
                        child: Text(
                          "Freelance Web & Mobile\nApp Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Colors.white70),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FlatButton(
                      onPressed: () {
                        scrollController.scrollTo(
                            index: 3, duration: Duration(milliseconds: 400));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Hire me",
                          style: TextStyle(fontSize: 18,color: kGrayBackground),
                        ),
                      ),
                      color: kYellowColor,
                    )
                  ],
                )),
            Expanded(
                flex: 6,
                child: Container(
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
    );
  }
}
