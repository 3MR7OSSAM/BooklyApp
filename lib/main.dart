import 'package:bookly/core/app_constants/color_manger.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/view_model/featured_cubit/featured_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/newest_cubit/newest_cubit.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_constants/route_manger.dart';

void main() {
  serUpServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>FeaturedCubit(getIt.get<HomeRepoImpl>())..getFeatured()),
        BlocProvider(create: (context)=>NewestCubit(getIt.get<HomeRepoImpl>())..getNewest()),
      ],
      child: MaterialApp.router(
        title: 'Bookly App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorManger.kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
        routerConfig: appRouter, // Use the router from app_router.dart
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
