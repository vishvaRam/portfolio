import 'package:flutter/material.dart';

class SectionSubTitle extends StatelessWidget {
  final String subTitle;
  final double fontSize;
  const SectionSubTitle({
    Key key,
    this.subTitle, this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: FittedBox(
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.white70,
                fontSize: fontSize,
                fontWeight: FontWeight.w300),textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
