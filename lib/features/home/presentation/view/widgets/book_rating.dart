import 'package:bookly/core/app_constants/color_manger.dart';
import 'package:bookly/core/app_constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.axisAlignment = MainAxisAlignment.start, required this.rating, required this.count });
  final num rating;
  final int count;

  final MainAxisAlignment axisAlignment;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: axisAlignment,
      children:  [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: ColorManger.kStarColor,
        ),
        SizedBox(width: 6.3),
        Text(
          '$rating',
          style: TextStyles.textStyle16,
        ),
        SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            '($count)',
            style: TextStyles.textStyle14,
          ),
        ),
      ],
    );
  }
}
