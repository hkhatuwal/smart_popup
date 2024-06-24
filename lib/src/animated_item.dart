
import 'package:flutter/material.dart';
class AnimatedItem extends StatefulWidget {
 final Widget item;
 final int index;
 final Duration? animationDuration;
 final Animation animation;

  const AnimatedItem({super.key,required this.item,required this.index,this.animationDuration,
 required this.animation});

  @override
  State<AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context,c) {
        return Transform.translate(
          offset:  Offset(0,widget.animation.value),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.item,
            ],
          )
        );
      }
    );
  }
}
