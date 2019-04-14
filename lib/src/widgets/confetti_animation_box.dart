import 'package:flutter/material.dart';
import './confetti_particle.dart';

class ConfettiAnimationBox extends StatefulWidget {
  ConfettiAnimationBox({Key key, this.child, this.duration = 1, this.amount = 30}) : super(key: key);

  final Widget child;
  final dynamic duration;
  final int amount;

  @override
  _ConfettiAnimationBoxState createState() => _ConfettiAnimationBoxState();
}

class _ConfettiAnimationBoxState extends State<ConfettiAnimationBox> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _stackList = [];

    //put wrapped child at bottom of stack
    _stackList.add(widget.child);

    //add particles equal to the amount specified in amount.widget if widget.animation is true
      for (int i = 0; i < widget.amount; i++) {
        _stackList.add(
            ConfettiParticle(
              color: Colors.red,
              width: 5,
              height: 5,
              duration: widget.duration
            )
          );
      }
  
    return Stack(
      children: _stackList,
    );
  }
}