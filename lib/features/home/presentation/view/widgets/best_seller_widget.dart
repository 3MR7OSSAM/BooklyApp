import 'package:bookly/core/app_constants/assets_manger.dart';
import 'package:bookly/core/app_constants/route_manger.dart';
import 'package:bookly/core/app_constants/text_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(Routes.bookDetails,extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: book.volumeInfo.imageLinks!.thumbnail),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child:  Text(
                        book.volumeInfo.title ?? '',
                        style: TextStyles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 3),
                   Text(
                    book.volumeInfo.authors?.first ??'',
                    style: TextStyles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                       'free',
                        style: TextStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                       BookRating(rating: book.volumeInfo.averageRating ?? 0, count: book.volumeInfo.ratingsCount ?? 0,),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
