import 'package:expense_tracker_app/components/charts.dart';
import 'package:expense_tracker_app/extensions/buildcontext/loc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsScreenView extends StatelessWidget {
  const StatsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.loc.transactions, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: Charts(),
              )
            )
          ],
        ),
      ),
    );
  }
}