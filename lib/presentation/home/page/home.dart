import 'package:flutter/material.dart';
import 'package:taskati/core/Function/navigator.dart';
import 'package:taskati/core/colors/colors.dart';
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
                  Date(),
                  32.h,
                  TabBarWidget(),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        //All
                        ViewTab(),
                        /*in progress*/
                        ViewTab(),
                        //completed
                        ViewTab(),
                      ],
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
