import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';


part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit(this.homeRepo) : super(FeaturedInitialState());
  final HomeRepo homeRepo;
  Future<void> getFeatured() async{
    var result = await homeRepo.fetchFeaturedBooks();
    emit(FeaturedLoadingState());
    result.fold((failure){
      emit(FeaturedFailureState(failure.message));
    }, (books){
      emit(FeaturedSuccessState(books));
    });
  }


}
