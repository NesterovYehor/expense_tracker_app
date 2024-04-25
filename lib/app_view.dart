import 'package:expense_tracker_app/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:expense_tracker_app/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:expense_tracker_app/screens/add_expense/viewModels/add_expense_viewmodel.dart';
import 'package:expense_tracker_app/screens/home/views/home_view.dart';
import 'package:expense_tracker_app/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => AddExpenseViewModel(),),
        BlocProvider(
          create: (context) => CreateCategoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetCategoryBloc(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: HomeView(),
      ),
    );
  }
}