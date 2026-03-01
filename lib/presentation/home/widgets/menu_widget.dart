import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';

class MenuWidget extends StatelessWidget {
  final String name;
  final String icon;

  const MenuWidget({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 60
      ),
      child: Column(
        spacing: 8,
        children: [
          CircleAvatar(
            maxRadius: 23,
            backgroundColor: AppPallete.primaryLight,
            child: SvgPicture.asset(icon),
          ),
      
          Text(
            name,
            style: AppText.medium12.copyWith(color: AppPallete.primaryNormal),
          ),
        ],
      ),
    );
  }
}
