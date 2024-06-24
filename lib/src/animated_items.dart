import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:smart_popup/src/animated_item.dart';
import 'package:smart_popup/src/smart_popup_menu_item.dart';

class AnimatedItems extends StatefulWidget {
  final List<Widget> slideItems;
  final double totalWidth;
  final double totalHeight;
  final Duration? animationDuration;

  const AnimatedItems(this.slideItems,
      {super.key, required this.totalWidth, required this.totalHeight, this.animationDuration});

  @override
  State<AnimatedItems> createState() => _AnimatedItemsState();
}

class _AnimatedItemsState extends State<AnimatedItems> with TickerProviderStateMixin {
  bool _isMoved = false;

  void _moveItems() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

   final List<AnimationController> _controllers=[];
  final List<Animation> animations = [];

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.animationDuration!,
      child: Container(
        color: Colors.white,
        width: _isMoved ? getTotalWidth() : 0,
        height: widget.totalHeight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...widget.slideItems.mapIndexed((index, item) {
              return AnimatedItem(
                item: item,
                index: index,
                animation: animations[index],
              );
            })
          ],
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
    initAnimations();
    startAnimations();
  }

  void initAnimations() {
    for (int i = 0; i < widget.slideItems.length; i++) {
      var controller = AnimationController(
        duration: widget.animationDuration ,
        vsync: this,
      );
      _controllers.add(controller);
      animations.add(Tween<double>(
        begin: 50,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      ));
    }
  }
  void startAnimations()async {
    for (var value in _controllers) {
      value.forward();
     await Future.delayed(Duration(milliseconds: widget.animationDuration
         !.inMilliseconds~/_controllers.length));
    }
  }
}
