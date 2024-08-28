import 'package:bookly/core/app_constants/assets_manger.dart';
import 'package:bookly/core/app_constants/route_manger.dart';
import 'package:bookly/core/app_constants/strings_manger.dart';
import 'package:bookly/features/splash/presentation/view/widgets/SlidingText.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsManger.appLogo),
        SlidingText(slidingAnimation: _slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _slidingAnimation = Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero).animate(_animationController);
    _animationController.forward();
  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      GoRouter.of(context).push(Routes.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
