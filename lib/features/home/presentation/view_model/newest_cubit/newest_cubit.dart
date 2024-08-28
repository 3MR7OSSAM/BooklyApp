import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit(this.homeRepo) : super(NewestInitialState());
  final HomeRepo homeRepo;
  Future<void> getNewest() async{
    var result = await homeRepo.fetchBestSellerBooks();
    emit(NewestLoadingState());
    result.fold((failure){
      emit(NewestFailureState(failure.message));
    }, (books){
      emit(NewestSuccessState(books));
    });
  }
}
