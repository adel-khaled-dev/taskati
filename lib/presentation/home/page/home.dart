import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Function/navigator.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/core/services/hive.dart';
import 'package:taskati/core/services/share_preferences.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/presentation/AddTask/page/add_task.dart';
import 'package:taskati/presentation/home/widget/container_detals_home.dart';
import 'package:taskati/presentation/home/widget/date.dart';
import 'package:taskati/presentation/home/widget/header.dart';
import 'package:taskati/presentation/home/widget/tab_bar_widget.dart';
import 'package:taskati/presentation/home/widget/view_tab.dart';
import 'package:taskati/styles/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String? name;
String? image;

class _HomeState extends State<Home> {
  @override
  void initState() {
    getcach();
    super.initState();
  }

  Future<void> getcach() async {
    image = Sharedprefs.getString(Sharedprefs.imageKey);
    name = Sharedprefs.getString(Sharedprefs.nameKey);
    setState(() {});
  }

  String selected = DateFormat('d MMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 22,
          left: 22,
          top: 40,
          bottom: 22,
        ),
        child: DefaultTabController(
          length: 3,
          child: Stack(
            children: [
              Column(
                children: [
                  Header(),
                  24.h,
                  ContainerDetalsHome(),
                  29.h,
                  Date(
                    ondate: (date) {
                      setState(() {
                        selected = DateFormat('d MMM yyyy').format(date);
                      });
                    },
                  ),
                  32.h,
                  TabBarWidget(),
                  Expanded(
                    //filter
                    child: ValueListenableBuilder<Box<DataTask>>(
                      valueListenable: HiveHelpar.taskBox.listenable(),
                      builder: (context, box, child) {
                        //final tasks = box.values.toList();
                        final List<DataTask> tasks = [];
                        for (var task in box.values) {
                          if (task.date == selected) {
                            tasks.add(task);
                          }
                        }
                        final inProgtess = tasks
                            .where((task) => !task.isCompleted)
                            .toList();
                        final completad = tasks
                            .where((task) => task.isCompleted)
                            .toList();

                        return TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            //All
                            ViewTab(tasks: tasks),
                            /*in progress*/
                            ViewTab(tasks: inProgtess),
                            //completed
                            ViewTab(tasks: completad),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: -5,
                child: ElevatedButton(
                  onPressed: () {
                    navigator(context, AddTask());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsApp.primarycolor,
                    minimumSize: Size(0, 50),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "+",
                    style: TextStyles.titel.copyWith(color: ColorsApp.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
