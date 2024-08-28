import 'package:bookly/core/errors/error_handler.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/app_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final AppService _appService;

  HomeRepoImpl(this._appService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await _appService.get(
          endPoint: 'volumes?filtering=free-ebooks&sorting=newest&q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    var data = await _appService.get(endPoint: 'volumes?filtering=free-ebooks&q=Computer Science');
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return Right(books);
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await _appService.get(
          endPoint: 'volumes?filtering=free-ebooks&sorting=relevance &q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
}
}
