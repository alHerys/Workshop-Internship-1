import 'package:flutter/material.dart';

class Background3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 430;
    final double _yScaling = size.height / 787;
    path.lineTo(176.5 * _xScaling, 61.2695 * _yScaling);
    path.cubicTo(
      107.396 * _xScaling,
      12.7845 * _yScaling,
      81.5 * _xScaling,
      0.0000629425 * _yScaling,
      0.641785 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0.641785 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      784.996 * _yScaling,
      0 * _xScaling,
      784.996 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      784.996 * _yScaling,
      430 * _xScaling,
      784.996 * _yScaling,
      430 * _xScaling,
      784.996 * _yScaling,
    );
    path.cubicTo(
      430 * _xScaling,
      784.996 * _yScaling,
      430 * _xScaling,
      129.679 * _yScaling,
      430 * _xScaling,
      129.679 * _yScaling,
    );
    path.cubicTo(
      378.5 * _xScaling,
      142.179 * _yScaling,
      267 * _xScaling,
      131.269 * _yScaling,
      176.5 * _xScaling,
      61.2695 * _yScaling,
    );
    path.cubicTo(
      176.5 * _xScaling,
      61.2695 * _yScaling,
      176.5 * _xScaling,
      61.2695 * _yScaling,
      176.5 * _xScaling,
      61.2695 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
