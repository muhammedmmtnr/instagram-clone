import 'package:flutter/cupertino.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/util/dimistion.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget weScreeenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {required this.mobileScreenLayout, required this.weScreeenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > WebScreenSize) {
          return weScreeenLayout;
        }
        return mobileScreenLayout;
      },
    );
  }
}