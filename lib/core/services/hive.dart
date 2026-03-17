

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati/core/model/taskdata.dart';
import 'package:taskati/hive/hive_registrar.g.dart';


class HiveHelpar {
  //box
  static late Box<DataTask> taskBox;
  //box Key
  static String taskBoxKey = 'taskBox';
  //init
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    taskBox = await Hive.openBox<DataTask>(taskBoxKey);
  }

  //putTask
  static Future<void> cashDataTask(String key, DataTask value) async {
    await taskBox.put(key, value);
  }

  //get
  static DataTask? getTask(String key) {
    return taskBox.get(key);
  }
}
