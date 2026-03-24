import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskati/core/Function/navigator.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/presentation/AddTask/page/add_task.dart';
import 'package:taskati/presentation/home/widget/card_task.dart';

class ViewTab extends StatefulWidget {
  const ViewTab({super.key, required this.tasks});
  final List<DataTask> tasks;

  @override
  State<ViewTab> createState() => _ViewTabState();
}

class _ViewTabState extends State<ViewTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty) {
      return Center(
        child: Text("No Tasks Found"), // Lottie.asset(ImagesApp.loding),
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        final task = widget.tasks[index];
        return Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),

            dismissible: DismissiblePane(
              onDismissed: () {
                HiveHelpar.taskBox.delete(task.id);
              },
            ),

            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) {
                  HiveHelpar.taskBox.delete(task.id);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HiveHelpar.cashDataTask(
                    task.id,
                    task.copywith(isCompleted: true),
                  );
                },
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.done,
                label: 'Completed',
              ),
              SlidableAction(
                onPressed: (context) {
                  navigator(context, AddTask(task: task));
                },
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),

          child: CardTask(task: task),
        );
      },
      separatorBuilder: (context, index) {
        return 18.h;
      },
      itemCount: widget.tasks.length,
    );
  }
}
