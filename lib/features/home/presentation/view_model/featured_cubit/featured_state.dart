part of 'featured_cubit.dart';

abstract class FeaturedState extends Equatable {
  const FeaturedState();
  @override
  List<Object> get props => [];
}

class FeaturedInitialState extends FeaturedState {}
class FeaturedLoadingState extends FeaturedState {}
class FeaturedFailureState extends FeaturedState {
  final String errorMessage;
  const FeaturedFailureState(this.errorMessage);
}

class FeaturedSuccessState extends FeaturedState {
  final List<BookModel> books;
  const FeaturedSuccessState(this.books);
}
