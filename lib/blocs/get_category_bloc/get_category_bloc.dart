import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/blocs/get_category_bloc/get_category_state.dart';
import 'package:expense_tracker_app/services/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'get_category_event.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  final FirebaseService categoryService = FirebaseService();
  GetCategoryBloc() : super(GetCategoryInitial()) {
    on<GetCategory>((event, emit) async{
      emit(GetCategoryLoading());
      try {
        final categories = await categoryService.getCategory();
        emit(GetCategorySuccess(categories: categories));
      } catch (e) {
        emit(GetCategoryFailure(error: e.toString()));
      }
    });
  }
}
