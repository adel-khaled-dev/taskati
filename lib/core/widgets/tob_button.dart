import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/styles/styles.dart';

class TobButton extends StatelessWidget {
  const TobButton({super.key, required this.name, required this.onPressed});
 final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.buttoncolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(126, 35),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyles.semitext.copyWith(color: ColorsApp.primarycolor),
      ),
    );
  }
}
