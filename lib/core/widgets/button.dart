import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/styles/styles.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.name, required this.onPressed});
  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.primarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        minimumSize: const Size(331, 48),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyles.titel.copyWith(color: ColorsApp.white),
      ),
    );
  }
}
