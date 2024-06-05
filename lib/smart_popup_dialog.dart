import 'package:flutter/material.dart';
import 'package:smart_popup/src/animated_items.dart';

class SmartPopupDialog extends StatefulWidget {
  final double x, y;
  final List<Widget> items;
  final double totalHeight, totalWidth;

  const SmartPopupDialog(
      {super.key,
      required this.x,
      required this.y,
      required this.items,
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
            Expanded(
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
              color: Colors.black.withOpacity(.1),
            ))),
            Positioned(
              top: getYAxis(),
              left: getXAxis(),
              child: AnimatedItems(widget.items,
                  totalHeight: widget.totalHeight, totalWidth: widget.totalWidth),
            ),
          ],
        ),
      ),
    );
  }
}
