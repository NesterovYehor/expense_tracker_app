import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/data/entities/category_entity.dart';
import 'package:expense_tracker_app/data/models/category.dart';
import 'package:expense_tracker_app/data/models/expense.dart';

class FirebaseService{
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection.doc(category.categoryId).set(category.toEntity().toDocument());
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<Category>> getCategory() async{
    try{
      return await categoryCollection.get().then(
        (value) => value.docs.map(
          (e) => Category.fromEntaty(CategoryEntity.fromDocument(e.data())
          )
        ).toList()
      );
    }catch (e){
      print(e.toString());
      throw e;
    }
  }

  Future<void> createExpense(Expense expense) async{
    try{
      await expenseCollection.doc(expense.expenseld).set(expense.toEntity().toDocument());
      print("Success");
    }catch (e){
      print(e.toString());
      throw e;
    }
  }
}