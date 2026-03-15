import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/styles/styles.dart';

class WidgetDate extends StatefulWidget {
  const WidgetDate({super.key, required this.onDateSelected});
  final Function(String) onDateSelected;
  @override
  State<WidgetDate> createState() => _WidgetDateState();
}

class _WidgetDateState extends State<WidgetDate> {
  String _date = DateFormat('d MMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var date = await showDatePicker(
          context: context,
          firstDate: DateTime(2025),
          lastDate: DateTime(2030),
          initialDate: DateTime.now(),
        );
        if (date != null) {
          setState(() {
            _date = DateFormat('d MMM yyyy').format(date);
          });
          widget.onDateSelected(_date);
        }
      },
      child: Container(
        width: double.infinity,
        height: 63,
        decoration: BoxDecoration(
          color: ColorsApp.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorsApp.grey.withValues(alpha: 0.2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            children: [
              SvgPicture.asset(IconApp.iconclender, width: 26, height: 26),
              10.w,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "date",
                    style: TextStyles.semitext.copyWith(
                      fontSize: 13,
                      color: ColorsApp.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _date,
                    style: TextStyles.semitext.copyWith(
                      color: ColorsApp.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(IconApp.iconselectdate),
            ],
          ),
        ),
      ),
    );
  }
}
