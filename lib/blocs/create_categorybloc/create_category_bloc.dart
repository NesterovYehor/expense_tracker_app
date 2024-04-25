import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/blocs/create_categorybloc/create_category_event.dart';
import 'package:expense_tracker_app/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final FirebaseService categoryService = FirebaseService();
  CreateCategoryBloc() : super(CreateCategoryInitial()){
    on<CreateCategory>((event, emit) async{
      emit(CreateCategoryLoading());
      try {
        await categoryService.createCategory(event.category);
        emit(CreateCategorySuccess());
      } catch (e) {
        emit(CreateCategoryFailure(error: e.toString()));
      }
    });
  }
}
