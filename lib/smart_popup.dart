import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:smart_popup/smart_popup_dialog.dart';
import 'package:smart_popup/src/smart_popup_menu_item.dart';
import 'package:smart_popup/src/smart_popup_route.dart';
export 'package:smart_popup/src/smart_popup_menu_item.dart';

class SmartPopup {
  static void show(BuildContext context,
      {required Offset position,
      required List<Widget> items,
      required double totalHeight,
        BoxDecoration? decoration,
        EdgeInsets? padding,
        BorderRadius? borderRadius,
        Duration? animationDuration,
      required double totalWidth}) {
    assert(items.isNotEmpty);
    Navigator.push(
        context,
        SmartPopupCustomRoute(SmartPopupDialog(
          x: position.dx,
          y: position.dy,
          items: items,
          totalWidth: totalWidth,
          borderRadius: borderRadius,
          decoration: decoration,
          animationDuration:animationDuration??Duration(milliseconds: 400),
          padding: padding,
          totalHeight: totalHeight,
        )));
  }
}
