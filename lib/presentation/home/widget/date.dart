import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';

class Date extends StatelessWidget {
  const Date({super.key, required this.ondate});
  final Function(DateTime) ondate;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: 90,
      width: 64,
      initialSelectedDate: DateTime.now(),
      selectionColor: ColorsApp.primarycolor,
      onDateChange: ondate,
    );
  }
}
