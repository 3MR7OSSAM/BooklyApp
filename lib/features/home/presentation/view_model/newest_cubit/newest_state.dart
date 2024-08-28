part of 'newest_cubit.dart';

abstract class NewestState extends Equatable {
  @override
  List<Object> get props => [];
  const NewestState();
}

class NewestInitialState extends NewestState {}
class NewestLoadingState extends NewestState {}
class NewestFailureState extends NewestState {
  final String errorMessage;
  const NewestFailureState(this.errorMessage);
}

class NewestSuccessState extends NewestState {
  final List<BookModel> books;
  const NewestSuccessState(this.books);
}

