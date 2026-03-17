import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/widgets/button.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/presentation/AddTask/widget/widget_date.dart';
import 'package:taskati/presentation/AddTask/widget/widget_filed_add_titel.dart';
import 'package:taskati/presentation/AddTask/widget/widget_time.dart';
import 'package:taskati/styles/styles.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, this.task});
  final DataTask? task;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late final TextEditingController _titelcontrol;
  late final TextEditingController _descrbtioncontrol;
  String date = DateFormat('d MMM yyyy').format(DateTime.now());
  String startTime = "";
  String endtTime = "";
  String title = "";
  String descrbtion = "";
  @override
  void initState() {
    super.initState();
    _titelcontrol = TextEditingController(text: widget.task?.title ?? "");
    _descrbtioncontrol = TextEditingController(
      text: widget.task?.descrbtion ?? "",
    );
    date = widget.task?.date ?? DateFormat('d MMM yyyy').format(DateTime.now());
    startTime = widget.task?.startTime ?? "";
    endtTime = widget.task?.endTime ?? "";
  }

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
          widget.task != null ? "Edit Task" : "Add Task",
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
                control: _titelcontrol,
                onChing: (value) {
                  title = value;
                },
                h: 50,
                hent: "Add Task",
                titel: "Titel",
              ),
              47.h,
              WidgetFiledAdd(
                control: _descrbtioncontrol,
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
                initialTime: startTime,
                onTimeDate: (value) {
                  startTime = value;
                },
                text: "Start Time",
              ),
              30.h,
              WidgetTime(
                initialTime: endtTime,
                onTimeDate: (value) {
                  endtTime = value;
                },
                text: "End Time",
              ),
              150.h,
              Button(
                name: widget.task != null ? "Save" : "Add Task",
                onPressed: () {
                  if (widget.task != null) {
                    HiveHelpar.cashDataTask(
                      widget.task!.id,
                      DataTask(
                        date: date,
                        endTime: endtTime,
                        startTime: startTime,
                        title: _titelcontrol.text,
                        descrbtion: _descrbtioncontrol.text,
                        isCompleted: false,
                        id: widget.task!.id,
                      ),
                    );
                  } else {
                    String id = DateTime.now().millisecondsSinceEpoch
                        .toString();
                    HiveHelpar.cashDataTask(
                      id,
                      DataTask(
                        date: date,
                        endTime: endtTime,
                        startTime: startTime,
                        title: title,
                        descrbtion: descrbtion,
                        isCompleted: false,
                        id: id,
                      ),
                    );
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
