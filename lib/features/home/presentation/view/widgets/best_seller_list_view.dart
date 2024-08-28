import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_widget.dart';
import 'package:bookly/features/home/presentation/view_model/newest_cubit/newest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/fetching_data_error.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestCubit, NewestState>(
      builder: (context, state) {
        if (state is NewestSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView.builder(
                itemCount: state.books.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BestSellerWidget(
                    book: state.books[index],
                  );
                }),
          );
        } else if (state is NewestFailureState) {
          return FetchingDataError(
            errorMessage: "Something went wring ${state.errorMessage}",
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
