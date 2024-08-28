import 'package:bookly/core/app_constants/text_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/view/widgets/books_action_buttons.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/view/widgets/similar_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.17),
                  child: CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
                ),
                 Text(
                  bookModel.volumeInfo.title ?? '',
                  style: TextStyles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: TextStyles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                BookRating(axisAlignment: MainAxisAlignment.center, rating:  bookModel.volumeInfo.averageRating??0, count:  bookModel.volumeInfo.ratingsCount??0,),
                const SizedBox(height: 10),
                BooksAction(book: bookModel,),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You Might Also Like',
                      style: TextStyles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                const SizedBox(height: 16),
                const SimilarListView(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
