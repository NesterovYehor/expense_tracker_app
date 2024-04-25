import 'package:expense_tracker_app/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category, required this.selectedCategory});

  Category category;
  bool selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: selectedCategory ? Border.all() : Border.all(color: Theme.of(context).colorScheme.background),
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(category.color),
          ),
          child: Image.asset("assets/icons/${category.icon}"),
        ),
        title: Text(category.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}