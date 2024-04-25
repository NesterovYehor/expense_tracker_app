import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/data/models/expense.dart';
import 'package:expense_tracker_app/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'upload_expense_event.dart';
part 'upload_expense_state.dart';

class UploadExpenseBloc extends Bloc<UploadExpenseEvent, UploadExpenseState> {
  FirebaseService _service = FirebaseService();
  UploadExpenseBloc() : super(UploadExpenseInitial()) {
    on<UploadExpense>((event, emit) {
      emit(UploadExpenseLoading());
      try {
        _service.createExpense(event.expense);
        emit(UploadExpenseSuccess());
      } catch (e) {
        emit(UploadExpenseFailure(error: e.toString()));
      }
    });
  }
}
