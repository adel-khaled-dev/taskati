import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati/core/Function/navigator.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/widgets/button.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/presentation/AddTask/widget/widget_date.dart';
import 'package:taskati/presentation/AddTask/widget/widget_filed_add_titel.dart';
import 'package:taskati/presentation/AddTask/widget/widget_time.dart';
import 'package:taskati/presentation/home/page/home.dart';
import 'package:taskati/styles/styles.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? date;
  String? startTime;
  String? endtTime;
  String? title;
  String? descrbtion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.all(0),
          icon: SvgPicture.asset(IconApp.iconback, width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Task",
          style: TextStyles.subtitel.copyWith(
            color: ColorsApp.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 22, left: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              67.h,
              WidgetFiledAdd(
                onChing: (value) {
                  title = value;
                },
                h: 50,
                hent: "Add Task",
                titel: "Titel",
              ),
              47.h,
              WidgetFiledAdd(
                onChing: (value) {
                  descrbtion = value;
                },
                h: 84,
                titel: "Description",
                hent: "",
              ),
              41.h,
              WidgetDate(
                onDateSelected: (value) {
                  date = value;
                },
              ),
              30.h,
              WidgetTime(
                onTimeDate: (value) {
                  startTime = value;
                },
                text: "Start Time",
              ),
              30.h,
              WidgetTime(
                onTimeDate: (value) {
                  endtTime = value;
                },
                text: "End Time",
              ),
              150.h,
              Button(
                name: "Add Task",
                onPressed: () {
                  String id = DateTime.now().microsecond.toString();
                  HiveHelpar.cashDataTask(
                    id,
                    DataTask(
                      date: date!,
                      endTime: endtTime!,
                      startTime: startTime!,
                      title: title!,
                      descrbtion: descrbtion!,
                      isCompleted: false,
                      id: id,
                    ),
                  );
                  navigator(context, Home());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
