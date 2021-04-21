import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final double lineHeight;
  const SectionTitle({
    Key key, this.title, this.fontSize, this.lineHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            FittedBox(child: Text(title,style: TextStyle(fontSize: fontSize,color: kYellowColor,fontWeight: FontWeight.w600),)),
            Container(
              height: lineHeight,
              width: 50,
              decoration: BoxDecoration(
                color: kYellowColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
