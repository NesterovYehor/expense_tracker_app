import 'package:expense_tracker_app/data/models/category.dart';
import 'package:meta/meta.dart'; 

@immutable
sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

class GetCategoryLoading extends GetCategoryState{}
class GetCategoryFailure extends GetCategoryState{
  String error;
  GetCategoryFailure({required this.error});  
}
class GetCategorySuccess extends GetCategoryState{
  
  List<Category> categories;

  GetCategorySuccess({required this.categories});
}
