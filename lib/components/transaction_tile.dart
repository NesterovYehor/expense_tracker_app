import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsTile extends StatelessWidget {
  const TransactionsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[700]
              ),
              width: 50,
              height: 50,
              child: Center(
                child: Icon(Icons.food_bank_outlined, color: Theme.of(context).colorScheme.background,),
              ),
            ),
            const SizedBox(width: 10,),
            Text("Food", style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w700),),
            const Spacer(),
            Column(
              children: [
                Text("-\$45.00", style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w700),),
                Text("Today", style: TextStyle(fontSize: 13, color: Theme.of(context).colorScheme.outline),)
              ],
            )
          ],
        ),
      ),
    );
  }
}