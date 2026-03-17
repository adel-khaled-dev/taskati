class DataTask {
  final String id;
  final String title;
  final String descrbtion;
  final String date;
  final String startTime;
  final String endTime;
  final bool isCompleted;

  DataTask({
    required this.id,
    required this.title,
    required this.descrbtion,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
  });

  DataTask copywith({
    String? id,
    String? title,
    String? descrbtion,
    String? date,
    String? startTime,
    String? endTime,
    bool? isCompleted,
  }) {
    return DataTask(
      id: id ?? this.id,
      title: title ?? this.title,
      descrbtion: descrbtion ?? this.descrbtion,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
