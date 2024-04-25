import 'package:expense_tracker_app/components/bottom_nav_bar.dart';
import 'package:expense_tracker_app/components/custom_icon_FAB.dart';
import 'package:expense_tracker_app/screens/add_expense/views/add_expense.dart';
import 'package:expense_tracker_app/screens/home/views/main_view.dart';
import 'package:expense_tracker_app/screens/stats/stats_screen_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var wigetList=[
    MainView(),
    StatsScreenView()
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavBar(onTap: (int value) {
        setState(() {
          index = value;
        });
      }, currentIndex: index,),
      floatingActionButton: CustomIconFAB(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpense(selectedDate: DateTime.now().add(Duration(days: 365)),),)),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: wigetList[index]
    );
  }
}