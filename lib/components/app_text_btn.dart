import 'package:flutter/material.dart';

class AppTextBtn extends StatelessWidget {
  AppTextBtn({super.key, required this.text, required this.onTap});

  String text;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: Theme.of(context).colorScheme.background, fontSize: 23),),
        ),
      ),
    );
  }
}