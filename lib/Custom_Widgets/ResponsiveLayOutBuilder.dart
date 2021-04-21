import 'package:flutter/material.dart';
import 'package:portfolio/Constants/Constants.dart';

class ResponsiveLayoutBuilder extends StatefulWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayoutBuilder(
      {Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);
  @override
  _ResponsiveLayoutBuilderState createState() =>
      _ResponsiveLayoutBuilderState();
}

class _ResponsiveLayoutBuilderState extends State<ResponsiveLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains){
        print(constrains.maxWidth);
        if(constrains.maxWidth < kTabletBreakPoint){
          print("Mobile View");
          return widget.mobile;
        } else if (constrains.maxWidth >= kTabletBreakPoint && constrains.maxWidth < kDesktopBreakPoint){
          print("Tab View");
          return widget.tablet ?? widget.mobile;
        }else {
          print("DeskTop View");
          return widget.desktop;
        }
      },
    );
  }
}
