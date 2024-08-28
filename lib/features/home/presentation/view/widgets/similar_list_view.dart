import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/fetching_data_error.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books/similar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailureState) {
          return FetchingDataError(
            errorMessage: "Something went wring ${state.errorMessage}",
          );
        } else {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * .15,
              child: const CustomCircularIndicator());
        }
      },
    );
  }
}
