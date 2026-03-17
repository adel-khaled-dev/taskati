import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/styles/styles.dart';

class WidgetFiledAdd extends StatelessWidget {
  const WidgetFiledAdd({
    super.key,
    required this.h,
    required this.titel,
    required this.hent, required this.onChing, required this.control,
  });
  final double h;
  final String titel;
  final String hent;
  final Function(String) onChing;
  final TextEditingController control;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: ColorsApp.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: TextFormField(
        controller: control,
        onChanged: onChing,
        decoration: InputDecoration(
          label: Text(titel),
          labelStyle: TextStyles.subtitel.copyWith(color: ColorsApp.grey),
          hintText: hent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
