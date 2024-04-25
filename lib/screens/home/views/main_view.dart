import 'package:expense_tracker_app/components/total_balance_container.dart';
import 'package:expense_tracker_app/components/transaction_tile.dart';
import 'package:expense_tracker_app/extensions/buildcontext/loc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow[700]
                      ),
                    ),
                    Icon(CupertinoIcons.person_fill, color: Colors.yellow[800],)
                  ],
                ),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.loc.wellcome, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.outline),),
                    Text("John Doe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground),)
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.settings))
              ],
            ),
            const SizedBox(height: 20,),
            const TotalBalanceContainer(),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.loc.transactions, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                Text(context.loc.view_all, style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.outline),)
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TransactionsTile(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
