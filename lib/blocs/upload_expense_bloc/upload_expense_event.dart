part of 'upload_expense_bloc.dart';

@immutable
sealed class UploadExpenseEvent {}

class UploadExpense extends UploadExpenseEvent{
  final Expense expense;

  UploadExpense({required this.expense});
}
