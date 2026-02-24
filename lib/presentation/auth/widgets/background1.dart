import 'package:flutter/material.dart';

class Background1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 430;
    final double yScaling = size.height / 787;
    path.lineTo(244.974 * xScaling, 62.3062 * yScaling);
    path.cubicTo(
      319.5 * xScaling,
      23.9432 * yScaling,
      359.058 * xScaling,
      -8.50797 * yScaling,
      437.346 * xScaling,
      2.00227 * yScaling,
    );
    path.cubicTo(
      437.346 * xScaling,
      2.00227 * yScaling,
      438 * xScaling,
      787.45 * yScaling,
      438 * xScaling,
      787.45 * yScaling,
    );
    path.cubicTo(
      438 * xScaling,
      787.45 * yScaling,
      0 * xScaling,
      787.45 * yScaling,
      0 * xScaling,
      787.45 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      787.45 * yScaling,
      0 * xScaling,
      82.5443 * yScaling,
      0 * xScaling,
      82.5443 * yScaling,
    );
    path.cubicTo(
      81.9977 * xScaling,
      111.061 * yScaling,
      146.785 * xScaling,
      112.85 * yScaling,
      244.974 * xScaling,
      62.3062 * yScaling,
    );
    path.cubicTo(
      244.974 * xScaling,
      62.3062 * yScaling,
      244.974 * xScaling,
      62.3062 * yScaling,
      244.974 * xScaling,
      62.3062 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
