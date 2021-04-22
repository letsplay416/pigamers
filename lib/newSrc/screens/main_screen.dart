import 'package:flutter/material.dart';
import 'package:pigamers/newSrc/screens/Modes/tablet_mode.dart';

import 'Modes/mobile_mode.dart';
import 'Modes/web_mode.dart';
import 'responsive.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: TabletMode(),
      desktop: WebMode(),
      mobile: MobileMode(),
    );
  }
}
