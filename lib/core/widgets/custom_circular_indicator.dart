import 'package:bookly/core/app_constants/color_manger.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,

      child: const Center(
          child: CircularProgressIndicator(
        color: ColorManger.kLightPrimaryColor,
      )),
    );
  }
}
