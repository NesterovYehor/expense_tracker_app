import 'package:expense_tracker_app/data/models/category.dart';

class ExpenseEnity{
  final String expenseld;
  final String count;
  final Category category;
  final DateTime date;

  ExpenseEnity({
    required this.expenseld,
    required this.count,
    required this.category,
    required this.date,
  });

  Map<String, Object?> toDocument(){
    return{
      "count": count,
      "category": category,
      "date": date,
      "expenseld": expenseld
    };
  }

  static ExpenseEnity fromDocument( Map<String, dynamic> doc){
    return ExpenseEnity(
      count: doc["count"], 
      category: doc["category"], 
      date: doc["date"], 
      expenseld: doc["expenseld"]
    );
  }
}