import 'package:flutter/material.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';

class OnboardingWidget extends StatefulWidget {
  final String imagePath;
  final String mainText;
  final String subText;
  final VoidCallback onPressed;

  const OnboardingWidget({
    super.key,
    required this.imagePath,
    required this.mainText,
    required this.subText,
    required this.onPressed,
  });

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Alignment> _alignAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    _alignAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      alignment: .bottomCenter,
      children: [
        AnimatedBuilder(
          animation: _alignAnimation,
          builder: (context, child) {
            return Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              alignment: _alignAnimation.value,
            );
          },
        ),

        Container(
          height: .infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0),
                const Color(0xff3b3b3b).withValues(alpha: 0.36),
                const Color(0xff2e2e2e).withValues(alpha: 0.46),
                const Color(0xff1d1d1d).withValues(alpha: 0.58),
              ],
            ),
          ),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.5, vertical: 20),
            child: Column(
              crossAxisAlignment: .stretch,
              mainAxisAlignment: .end,
              children: [
                Text(
                  widget.mainText,
                  style: AppText.semiBold52.copyWith(
                    color: AppPallete.neutral100,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.subText,
                        maxLines: 2,
                        style: AppText.regular16.copyWith(
                          color: AppPallete.neutral100,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: widget.onPressed,
                      style: OutlinedButton.styleFrom(
                        iconColor: AppPallete.yellowLight,
                        side: const BorderSide(
                          color: AppPallete.yellowLight,
                          width: 3,
                        ),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
