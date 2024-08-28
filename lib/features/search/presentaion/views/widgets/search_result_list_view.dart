import 'package:bookly/features/home/presentation/view/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // return const BestSellerWidget();
        },
      ),
    );
  }
}
