import 'package:bookly/core/app_constants/strings_manger.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required Animation<Offset> slidingAnimation,
  }) : _slidingAnimation = slidingAnimation;

  final Animation<Offset> _slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slidingAnimation,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: _slidingAnimation,
          child: const Text(
            StringsManger.splashTitle,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
