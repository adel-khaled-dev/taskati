import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/styles/styles.dart';

class WidgetTime extends StatefulWidget {
  const WidgetTime({super.key, required this.text, required this.onTimeDate});
  final Function(String) onTimeDate;
  final String text;
  @override
  State<WidgetTime> createState() => _WidgetTimeState();
}

class _WidgetTimeState extends State<WidgetTime> {
  String _time = "Select time";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time != null) {
          setState(() {
            _time = time.format(context);
          });
          widget.onTimeDate(_time);
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
              SvgPicture.asset(IconApp.iconTime, width: 26, height: 26),
              10.w,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    style: TextStyles.semitext.copyWith(
                      fontSize: 13,
                      color: ColorsApp.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _time,
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
