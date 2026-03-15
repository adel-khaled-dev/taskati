import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/taskdata.dart';



class HiveHelpar {
  //box
  static late Box<DataTask> taskBox;
  //box Key
  static String taskBoxKey = 'taskBox';
  //init
  static Future<void> init() async {
    await Hive.initFlutter();
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
