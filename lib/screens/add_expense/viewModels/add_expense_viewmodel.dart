import 'package:expense_tracker_app/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:expense_tracker_app/blocs/create_categorybloc/create_category_event.dart';
import 'package:expense_tracker_app/blocs/upload_expense_bloc/upload_expense_bloc.dart';
import 'package:expense_tracker_app/data/models/category.dart';
import 'package:expense_tracker_app/data/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpenseViewModel extends ChangeNotifier {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Category? selectedCategory;

  List<String> icons = [
    "shopping.png",
    "sport.png",
    "restaurant.png",
    "gas.png",
    "health.png",
  ];

  List<Color> colors = [
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.yellow.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200
  ];

  int selectedIconIndex = 0;
  int selectedColorIndex = 0;

  AddExpenseViewModel() {
    dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
  }

  void createCategory() {
    CreateCategoryBloc().add(CreateCategory(
      category: Category(
        categoryId: const Uuid().v1(),
        name: categoryNameController.text,
        icon: icons[selectedIconIndex],
        color: colors[selectedColorIndex].value,
      ),
    ));
  }

  void selectCategory(Category category) {
    selectedCategory = category;
    print(selectedCategory?.name ?? "Penis");
    notifyListeners();
  }

  void createExpense() {
    if (selectedCategory != null) {
      UploadExpenseBloc().add(UploadExpense(
        expense: Expense(
          count: expenseController.text,
          category: selectedCategory!,
          date: selectedDate,
          expenseld: const Uuid().v1(),
        ),
      ));
    } else {
      print('Error: selectedCategory is null');
    }
  }
}
