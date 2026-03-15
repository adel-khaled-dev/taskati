import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';

class FiledText extends StatelessWidget {
  const FiledText({super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0, left: 2),
      child: Container(
        padding: EdgeInsets.only(left: 12),
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsApp.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorsApp.black.withValues(alpha: .1),
              blurRadius: 2,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
