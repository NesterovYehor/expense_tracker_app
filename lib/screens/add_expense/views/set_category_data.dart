import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/components/app_text_btn.dart';
import 'package:expense_tracker_app/components/app_text_field.dart';
import 'package:expense_tracker_app/extensions/buildcontext/loc.dart';
import 'package:expense_tracker_app/screens/add_expense/viewModels/add_expense_viewmodel.dart';

class SetCategoryDataWidget extends StatefulWidget {
  final AddExpenseViewModel viewModel;

  const SetCategoryDataWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<SetCategoryDataWidget> createState() => _SetCategoryDataWidgetState();
}

class _SetCategoryDataWidgetState extends State<SetCategoryDataWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.loc.create_a_category),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.674,
            child: AppTextField(
              icon: null,
              text: context.loc.name,
              onTap: () {},
              readOnly: false,
              controller: widget.viewModel.categoryNameController,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.674,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: widget.viewModel.icons.length,
              itemBuilder: (BuildContext context, int index) { 
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.viewModel.selectedIconIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: widget.viewModel.selectedIconIndex == index ? 
                          Border.all(color: Theme.of(context).colorScheme.onBackground) :
                          Border.all(color: Theme.of(context).colorScheme.background)
                      ),
                      child: Image.asset("assets/icons/${widget.viewModel.icons[index]}"),
                    ),
                  );
               },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.674,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: widget.viewModel.icons.length,
              itemBuilder: (BuildContext context, int index) { 
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.viewModel.selectedColorIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.viewModel.colors[index],
                        border: widget.viewModel.selectedColorIndex == index ? 
                          Border.all(color: Theme.of(context).colorScheme.onBackground) :
                          Border.all(color: Theme.of(context).colorScheme.background)
                      ),
                    ),
                  );
               },
            ),
          ),
          const SizedBox(height: 16,),
          AppTextBtn(
            text: context.loc.save,
            onTap: () {
              if (widget.viewModel.categoryNameController.text.isNotEmpty) {
                widget.viewModel.createCategory();
                Navigator.pop(context);
              } else {
                // Handle empty category name
              }
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.viewModel.categoryNameController.dispose();
    super.dispose();
  }
}

// SelectorWidget<String>(
//             list: widget.viewModel.icons,
//             selectedIndex: widget.viewModel.selectedIconIndex,
//             itemBuilder: (BuildContext context, String item, bool isSelected) {
//               return Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isSelected ? Colors.grey.withOpacity(0.5) : null,
//                 ),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       widget.viewModel.selectedIconIndex = widget.viewModel.icons.indexOf(item);
//                     });
//                   },
//                   child: Image.asset(
//                     "assets/icons/$item",
//                     width: 50,
//                     height: 50,
//                   ),
//                 ),
//               );
//             },
//             onSelectionChanged: (int index) {
//               // Handle selection change here if needed
//             },
//           ),
