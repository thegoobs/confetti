library confetti;

//packages
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Confetti extends StatefulWidget {
  Confetti({Key key, this.child, this.duration = 5, this.amount = 30}) : super(key: key);

  final Widget child;
  final dynamic duration;
  final int amount;

  void start (BuildContext context) {
  }

  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this 
    );

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {

        }); 
      });

    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _stackList = [];

    //put wrapped child at bottom of stack
    _stackList.add(widget.child);

    //add particles equal to the amount specified in amount.widget
    for (int i = 0; i < widget.amount; i++) {
      _stackList.add(
        Positioned(
          left: ((i + 1) * 10 + animation.value).toDouble(),
          child: Container(
            color: Colors.red,
            width: 5,
            height: 5,
          ),
        ));
    }

    return Stack(
      children: _stackList,
    );
  }
}