import 'package:flutter/material.dart';
import 'package:pigamers/src/screens/desktopmode/desktop_mode.dart';
import 'package:pigamers/src/screens/mobilemode/mobile_mode.dart';
import 'package:pigamers/src/screens/tabletmode/tablet_mode.dart';
import 'package:pigamers/src/screens/webmode/web_mode.dart';
import 'package:pigamers/src/services/responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: TabletMode(),
      desktop: DesktopMode(),
      mobile: MobileMode(),
      web: WebMode(),
    );
  }
}
