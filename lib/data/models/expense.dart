import 'package:expense_tracker_app/data/entities/entity.dart';
import 'package:expense_tracker_app/data/models/category.dart';

class Expense{
  final String expenseld;
  final String count;
  final Category category;
  final DateTime date;

  Expense({
    required this.count,
    required this.category,
    required this.date,
    required this.expenseld
  });

    ExpenseEnity toEntity(){
    return ExpenseEnity(
      expenseld: expenseld,
      count: count,
      category: category,
      date: date, 
    );
  }

  static ExpenseEnity fromEntaty(ExpenseEnity entity){
    return ExpenseEnity(
      expenseld: entity.expenseld,
       count: entity.count, 
       category: entity.category, 
       date: entity.date
    );
  }
}