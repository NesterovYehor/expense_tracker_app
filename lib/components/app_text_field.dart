 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.readOnly,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  final IconData? icon;
  final String text;
  final Function()? onTap;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        prefixIcon: icon != null ? Icon(icon, size: 16) : null,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), 
          borderSide: BorderSide(color: Theme.of(context).colorScheme.background)
        ),
      ),
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
