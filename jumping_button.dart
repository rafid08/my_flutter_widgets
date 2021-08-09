///[JumpingButton] is a button that has jumping effect.
///It gets scaled down when it is tapped.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JumpingButton extends StatefulWidget {
  const JumpingButton({
    Key key,
    @required this.child,
    @required this.onTap,
    this.upperbound=0.1,
    this.lowerbound=0.0,
    this.haptic=true,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final double upperbound;
  final double lowerbound;
  final bool haptic;

  @override
  _JumpingButtonState createState() => _JumpingButtonState();
}

class _JumpingButtonState extends State<JumpingButton> with SingleTickerProviderStateMixin {

  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: widget.lowerbound,
      upperBound: widget.upperbound,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Listener(
      onPointerDown: (_) {
        if(widget.onTap!=null){
          _controller.forward();
          if (widget.haptic) HapticFeedback.lightImpact();
        }
      },
      onPointerUp: (_) {
        if(widget.onTap!=null){
          _controller.reverse();
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }
}