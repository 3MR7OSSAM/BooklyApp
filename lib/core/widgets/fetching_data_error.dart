import 'package:bookly/core/app_constants/text_styles.dart';
import 'package:flutter/material.dart';

class FetchingDataError extends StatelessWidget {
  const FetchingDataError({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Something went wrong :$errorMessage',
      style: TextStyles.textStyle16,
      textAlign: TextAlign.center,
    ));
  }
}
