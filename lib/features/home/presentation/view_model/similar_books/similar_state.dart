part of 'similar_cubit.dart';

@immutable
abstract class SimilarState {}
 class SimilarBooksInitialState extends SimilarState {}
 class SimilarBooksLoadingState extends SimilarState {}
 class SimilarBooksSuccessState extends SimilarState {
  final List<BookModel> books;
  SimilarBooksSuccessState(this.books);
 }
 class SimilarBooksFailureState extends SimilarState {
  final String errorMessage;
  SimilarBooksFailureState(this.errorMessage);
 }
