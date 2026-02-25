// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../../core/theme/app_pallete.dart';

class AuthBackground extends StatelessWidget {
  final CustomClipper<Path> background1;
  final Color background1Color;
  final CustomClipper<Path>? background2;
  final Color? background2Color;
  final CustomClipper<Path>? background3;
  final Color? background3Color;

  const AuthBackground({
    super.key,
    required this.background1,
    this.background2,
    this.background3,
    required this.background1Color,
    this.background2Color,
    this.background3Color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
      child: Stack(
        children: [
          ClipPath(
            clipper: background1,
            child: Container(color: background1Color),
          ),
          if (background2 != null)
            ClipPath(
              clipper: background2,
              child: Container(color: background2Color),
            ),

          if (background3 != null)
            ClipPath(
              clipper: background3,
              child: Container(color: background3Color),
            ),
        ],
      ),
    );
  }
}
