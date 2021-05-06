import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final double fontSize;
  final Color coloreOftext;

  const SectionTitle({
    Key key, this.title, this.fontSize, this.coloreOftext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FittedBox(child: Text(title,style: TextStyle(fontSize: fontSize,color: kYellowColor,fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
