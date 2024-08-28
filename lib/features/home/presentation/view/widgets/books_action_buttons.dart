import 'package:bookly/core/app_constants/color_manger.dart';
import 'package:bookly/core/app_constants/text_styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          CustomButton(
            onTap: () {},
            color: ColorManger.kWhiteColor,
            radius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            child: Text(
              'Free',
              style:
              TextStyles.textStyle16.copyWith(color: ColorManger.kBlackColor),
            ),
          ),
          CustomButton(
            onTap: () async{
                final url = Uri.parse(book.volumeInfo.previewLink ?? '');
                if ( await canLaunchUrl(url)) {
                 launchUrl(url);
                }

            },
            color: ColorManger.kOrangeColor,
            radius: const BorderRadius.only(
                topRight: Radius.circular(15), bottomRight: Radius.circular(16)),
            child:  Text(
              'Free Preview',
              style: TextStyles.textStyle16.copyWith(color: ColorManger.kWhiteColor),textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
