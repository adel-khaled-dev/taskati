import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/styles/styles.dart';

class CardTask extends StatelessWidget {
  const CardTask({super.key, required this.task});

  final DataTask task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0, left: 3),
      child: Container(
        width: double.infinity,
        height: 94,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 0.01,
              color: ColorsApp.black.withValues(alpha: 0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: ColorsApp.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 14,
            left: 14,
            top: 4,
            bottom: 4,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyles.semitext.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.black,
                ),
                maxLines: 1,
              ),
              3.h,
              Text(
                task.descrbtion,
                style: TextStyles.hinttext.copyWith(
                  color: ColorsApp.grey,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              8.h,
              Row(
                children: [
                  SvgPicture.asset(IconApp.iconTime),
                  6.w,
                  Text(
                    "${task.startTime} - ${task.endTime}",
                    style: TextStyle(color: ColorsApp.primarycolor),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: task.isCompleted == false
                          ? Color(0xffFFE9E1)
                          : ColorsApp.lightpr,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      task.isCompleted == false ? "In Progress" : "Done",
                      style: TextStyle(
                        color: task.isCompleted == false
                            ? const Color(0xffFF7D53)
                            : ColorsApp.primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
