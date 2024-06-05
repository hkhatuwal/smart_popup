import 'package:flutter/material.dart';

class SmartPopupCustomRoute<T> extends PopupRoute<T> {
  final Widget child;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => "Labeld";

  SmartPopupCustomRoute(this.child);

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1);
}
