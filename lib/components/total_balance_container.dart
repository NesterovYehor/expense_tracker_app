import 'dart:math';

import 'package:expense_tracker_app/extensions/buildcontext/loc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalBalanceContainer extends StatelessWidget {
  const TotalBalanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient( 
          colors: [
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary
          ],
          transform: const GradientRotation (pi / 4),
        ),
        boxShadow:[
          BoxShadow(
            blurRadius: 5,
            color: Theme.of(context).colorScheme.outline,
            offset: Offset(5, 5)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.loc.total_balance, style: TextStyle(color: Theme.of(context).colorScheme.background, fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 12,),
          Text("€ 4800.00", style: TextStyle(color: Theme.of(context).colorScheme.background, fontSize: 40, fontWeight: FontWeight.w600),),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:  12.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: const Center(child: Icon(CupertinoIcons.arrow_down, size: 15,),),
                    ),
                    Column(
                      children: [
                        Text(context.loc.income, style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),),
                        Text("€ 2500.00", style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: const Center(child: Icon(CupertinoIcons.arrow_down, size: 15,),),
                    ),
                    Column(
                      children: [
                        Text(context.loc.expenses, style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),),
                        Text("€ 800.00", style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w600),)
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}