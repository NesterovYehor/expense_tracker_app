import 'package:expense_tracker_app/data/models/category.dart';
import 'package:meta/meta.dart'; // Make sure to import meta package for @immutable annotation

@immutable
sealed class CreateCategoryEvent {}

class CreateCategory extends CreateCategoryEvent {
  final Category category;

  CreateCategory({required this.category});
}
