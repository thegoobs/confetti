import 'package:flutter/material.dart';
import 'dart:math';

class ConfettiParticle extends StatefulWidget {
  ConfettiParticle({this.width, this.height, this.color, this.duration = 5});

  final double width;
  final double height;
  final Color color;
  final int duration;

  final double xPos = 200;
  final double yPos = 400;
  final double delta = Random().nextDouble() * (Random().nextBool()? 100 : -100);

  @override
  _ConfettiParticleState createState() => _ConfettiParticleState();
}

class _ConfettiParticleState extends State<ConfettiParticle> with TickerProviderStateMixin {
  Animation<double> fallingAnimation;
  Animation<double> driftAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this 
    );

    fallingAnimation = Tween<double>(begin: widget.yPos, end: widget.yPos + cos(widget.delta) * widget.delta).animate(CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
        }); 
      });

    driftAnimation = Tween<double>(begin: widget.xPos, end: widget.xPos + sin(widget.delta) * widget.delta).animate(CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
        });
      });

      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: fallingAnimation.value,
      left: driftAnimation.value,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: widget.color
      ),
    );
  }
}