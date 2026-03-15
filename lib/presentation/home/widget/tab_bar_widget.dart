import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      contentCenter: true,
      buttonMargin: EdgeInsets.symmetric(horizontal: 10),
      unselectedBackgroundColor: ColorsApp.lightpr,
      physics: NeverScrollableScrollPhysics(),
      backgroundColor: ColorsApp.primarycolor,
      height: 40,
      width: 120,
      tabs: [
        Tab(text: "All"),
        Tab(text: "In Progress"),
        Tab(text: "Completed"),
      ],
    );
  }
}
