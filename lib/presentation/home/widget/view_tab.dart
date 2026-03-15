import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/widgets/extension.dart';

class ViewTab extends StatefulWidget {
  const ViewTab({super.key});

  @override
  State<ViewTab> createState() => _ViewTabState();
}

class _ViewTabState extends State<ViewTab> {
  List<DataTask> task = [];
  @override
  void initState() {
    super.initState();
    task = HiveHelpar.taskBox.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 3.0, left: 3),
          child: Container(
            width: 331,
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
            child: Text(task[index].title),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return 18.h;
      },
      itemCount: task.length,
    );
  }
}
