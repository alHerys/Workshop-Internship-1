// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../../core/theme/app_pallete.dart';
import 'background1.dart';
import 'background2.dart';
import 'background3.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.1,
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: Background1(),
            child: Container(
              color: AppPallete.neutral100.withValues(alpha: 0.4),
            ),
          ),
          ClipPath(
            clipper: Background2(),
            child: Container(
              color: AppPallete.neutral100.withValues(alpha: 0.5),
            ),
          ),
          ClipPath(
            clipper: Background3(),
            child: Container(color: AppPallete.neutral100),
          ),
        ],
      ),
    );
  }
}
