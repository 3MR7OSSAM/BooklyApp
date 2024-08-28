
import 'package:bookly/core/app_constants/route_manger.dart';
import 'package:bookly/core/widgets/custom_circular_indicator.dart';
import 'package:bookly/core/widgets/fetching_data_error.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/view_model/featured_cubit/featured_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedSuccessState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .25,
            child: ListView.builder(
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(Routes.bookDetails,extra: state.books[index]);
                      },
                      child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks!.thumbnail,));
                }),
          );
        } else if (state is FeaturedFailureState) {
          return FetchingDataError(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
