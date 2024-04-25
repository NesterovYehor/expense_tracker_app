part of 'upload_expense_bloc.dart';

@immutable
sealed class UploadExpenseState {}

final class UploadExpenseInitial extends UploadExpenseState {}

final class UploadExpenseLoading extends UploadExpenseState {}

final class UploadExpenseFailure extends UploadExpenseState {
  String error;
  UploadExpenseFailure({required this.error});
}

final class UploadExpenseSuccess extends UploadExpenseState {}