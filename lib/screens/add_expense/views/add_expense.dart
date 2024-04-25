import 'package:expense_tracker_app/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:expense_tracker_app/blocs/get_category_bloc/get_category_state.dart';
import 'package:expense_tracker_app/components/app_text_btn.dart';
import 'package:expense_tracker_app/components/app_text_field.dart';
import 'package:expense_tracker_app/components/category_tile.dart';
import 'package:expense_tracker_app/screens/add_expense/views/set_category_data.dart';
import 'package:expense_tracker_app/extensions/buildcontext/loc.dart';
import 'package:expense_tracker_app/screens/add_expense/viewModels/add_expense_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddExpense extends StatelessWidget {
  AddExpense({super.key, required this.selectedDate});

  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    context.read<GetCategoryBloc>().add(GetCategory());

    return Consumer<AddExpenseViewModel>(
      builder:(context, vm, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.loc.add_expenses,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 16),
                child: AppTextField(
                  icon: FontAwesomeIcons.dollarSign,
                  text: '',
                  onTap: () {},
                  readOnly: false,
                  controller: vm.expenseController,
                  keyboardType: TextInputType.number,
                ),
              ),
              AppTextField(
                  icon: FontAwesomeIcons.list,
                  text: 'Category',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SetCategoryDataWidget(
                        viewModel: vm,
                      ),
                    );
                  },
                  readOnly: true,
                  controller: vm.categoryController,
                  keyboardType: TextInputType.none,
                ),
              BlocBuilder<GetCategoryBloc, GetCategoryState>(
                builder: (context, state) {
                  if (state is GetCategoryLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(state is GetCategorySuccess){
                    final categories = state.categories;
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return GestureDetector(
                                onTap: () {
                                  vm.selectCategory(category);
                                },
                                child: CategoryTile(
                                  category: category,
                                  selectedCategory: vm.selectedCategory == category, // Change this line
                                ),
                              );
                            },
                          ),
                        ),
                      );
                  }else if(state is GetCategoryFailure){
                    return Center(child: Text(state.error),);
                  }else{
                    return const Center(child: Text("Something went wrong"),);
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                icon: FontAwesomeIcons.list,
                text: 'Date',
                onTap: () async {
                  vm.selectedDate = (await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: selectedDate))!;
                  vm.dateController.text =
                      DateFormat('dd/MM/yyyy').format(vm.selectedDate);
                              },
                readOnly: true,
                controller: vm.dateController,
                keyboardType: TextInputType.none,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: GestureDetector(
                  onTap: () => vm.createExpense(),
                  child: AppTextBtn(
                    text: "Save",
                    onTap: () {
                      vm.createExpense();
                      print(vm.selectedCategory);
                    }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
