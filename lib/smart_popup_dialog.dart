import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_popup/src/animated_items.dart';

class SmartPopupDialog extends StatefulWidget {
  final double x, y;
  final List<Widget> items;
  final double totalHeight, totalWidth;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Duration? animationDuration;

  const SmartPopupDialog(
      {super.key,
      required this.x,
      required this.y,
      this.padding,
      required this.items,
      this.borderRadius,
      this.decoration,
      this.animationDuration,
      required this.totalHeight,
      required this.totalWidth});

  @override
  State<SmartPopupDialog> createState() => _SmartPopupDialogState();
}

class _SmartPopupDialogState extends State<SmartPopupDialog> {
  double getXAxis() {
    double itemWidth = getItemsTotalWidth();
    if ((widget.x + itemWidth) >= MediaQuery.of(context).size.width) {
      var overflowWidth = (widget.x + itemWidth) - MediaQuery.of(context).size.width;
      return widget.x - overflowWidth;
    }
    return widget.x;
  }

  double getYAxis() {
    return widget.y + 10;
  }

  double getItemsTotalWidth() {
    return widget.totalWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      color: Colors.black.withOpacity(.1),
                    ))),
            Positioned(
              top: getYAxis(),
              left: getXAxis(),
              child: Container(
                padding: widget.padding ?? const EdgeInsets.all(10),
                decoration: widget.decoration ??
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(100),
                  child: AnimatedItems(widget.items,
                      totalHeight: widget.totalHeight, totalWidth: widget.totalWidth,
                    animationDuration: widget.animationDuration,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
