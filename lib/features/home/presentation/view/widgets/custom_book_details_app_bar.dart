import 'package:bookly/core/app_constants/route_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              size: 22,
            )),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.searchView);
              },
            icon: const Icon(
              Icons.search,
              size: 22,
            )),
      ],
    );
  }
}
