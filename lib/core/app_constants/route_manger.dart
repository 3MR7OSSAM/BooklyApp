import 'package:bookly/core/app_constants/strings_manger.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view/book_details_view.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books/similar_cubit.dart';
import 'package:bookly/features/search/presentaion/views/search_view.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/";
  static const String home = "/home_view";
  static const String bookDetails = "/book_details";
  static const String searchView = "/search_view";
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SplashView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/home_view',
      name: 'home',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const HomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/book_details',
      name: 'bookDetails',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (BuildContext context) {
            return SimilarCubit(getIt.get<HomeRepoImpl>());
          },
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/search_view',
      name: 'searchView',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SearchView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text(
        StringsManger.noRouteFound,
        style: TextStyle(fontSize: 20),
      ),
    ),
    body: const SafeArea(
      child: Center(
        child: Text(
          StringsManger.noRouteFound,
          style: TextStyle(fontSize: 35),
        ),
      ),
    ),
  ),
);
