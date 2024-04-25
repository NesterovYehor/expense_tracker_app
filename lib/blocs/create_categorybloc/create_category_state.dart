part of 'create_category_bloc.dart';

@immutable
sealed class CreateCategoryState {}

final class CreateCategoryInitial extends CreateCategoryState {}

final class CreateCategoryLoading extends CreateCategoryState {}
final class CreateCategoryFailure extends CreateCategoryState {
  final String error;
  CreateCategoryFailure({required this.error});
}
final class CreateCategorySuccess extends CreateCategoryState {}
