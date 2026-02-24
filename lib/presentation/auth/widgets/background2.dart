import 'package:flutter/material.dart';

class Background2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 430;
    final double _yScaling = size.height / 787;
    path.lineTo(213 * _xScaling, 61.1918 * _yScaling);
    path.cubicTo(
      290.373 * _xScaling,
      98.479 * _yScaling,
      387.4 * _xScaling,
      41.9467 * _yScaling,
      430.349 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      430.349 * _xScaling,
      0 * _yScaling,
      431 * _xScaling,
      784 * _yScaling,
      431 * _xScaling,
      784 * _yScaling,
    );
    path.cubicTo(
      431 * _xScaling,
      784 * _yScaling,
      -5 * _xScaling,
      784 * _yScaling,
      -5 * _xScaling,
      784 * _yScaling,
    );
    path.cubicTo(
      -5 * _xScaling,
      784 * _yScaling,
      -5 * _xScaling,
      61.1918 * _yScaling,
      -5 * _xScaling,
      61.1918 * _yScaling,
    );
    path.cubicTo(
      46.7116 * _xScaling,
      12.4841 * _yScaling,
      144.051 * _xScaling,
      27.9645 * _yScaling,
      213 * _xScaling,
      61.1918 * _yScaling,
    );
    path.cubicTo(
      213 * _xScaling,
      61.1918 * _yScaling,
      213 * _xScaling,
      61.1918 * _yScaling,
      213 * _xScaling,
      61.1918 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
