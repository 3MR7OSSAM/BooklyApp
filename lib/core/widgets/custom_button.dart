import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, required this.color, required this.radius, this.onTap});

  final Widget child;
  final Color color;
  final BorderRadiusGeometry radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: radius,
              )),
          onPressed: onTap,
          child: child),
    );
  }
}
