import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepo) : super(SimilarBooksInitialState());
  final HomeRepo homeRepo;
  Future<void> getSimilar({required String category}) async{
    var result = await homeRepo.fetchSimilarBooks(category: category);
    emit(SimilarBooksLoadingState());
    result.fold((failure){
      emit(SimilarBooksFailureState(failure.message));
    }, (books){
      emit(SimilarBooksSuccessState(books));
    });
  }
}
