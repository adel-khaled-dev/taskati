import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/styles/styles.dart';

class ContainerDetalsHome extends StatelessWidget {
  const ContainerDetalsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105,
      decoration: BoxDecoration(
        color: ColorsApp.primarycolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          top: 14,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat("EEEE dd MMM").format(DateTime.now()),
                  style: TextStyles.semitext.copyWith(
                    color: ColorsApp.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                13.h,
                Text(
                  "Your today’s task almost\nalmost",
                  style: TextStyles.semitext.copyWith(
                    color: ColorsApp.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 76,
                  height: 76,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation(ColorsApp.white),
                    strokeWidth: 8,
                    value: 0.85,
                    backgroundColor: ColorsApp.lightPurple,
                  ),
                ),
                Text(
                  "85%",
                  style: TextStyles.semitext.copyWith(
                    color: ColorsApp.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
