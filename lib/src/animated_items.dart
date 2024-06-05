import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:smart_popup/src/smart_popup_menu_item.dart';

class AnimatedItems extends StatefulWidget {
  final List<Widget> slideItems;
  final double totalWidth;
  final double totalHeight;

  const AnimatedItems(this.slideItems, {super.key,required this.totalWidth,required this.totalHeight});

  @override
  State<AnimatedItems> createState() => _AnimatedItemsState();
}

class _AnimatedItemsState extends State<AnimatedItems> {
  bool _isMoved = false;

  void _moveItems() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: AnimatedSize(
        duration: Duration(milliseconds: 350),
        child: Container(
          color: Colors.white,
          width:_isMoved? getTotalWidth():0,
          height:  widget.totalHeight,
          child: Stack(
            children: <Widget>[
              ...widget.slideItems.mapIndexed((index, item) {
                return AnimatedPositioned(
                  duration:  Duration(milliseconds: 350*index),
                  top: _isMoved?0:widget.totalHeight+10,
                  bottom: _isMoved?0:null,
                  left: true ? index * (getTotalWidth()/widget.slideItems.length) : (getTotalWidth
                    () /
                      2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      item,
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  double getTotalWidth() {
    return widget.totalWidth;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        _moveItems();
      });
    });
  }
}
