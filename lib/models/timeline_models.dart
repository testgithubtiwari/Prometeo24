class TimeLineModel {
  final int id;
  final String eventName;
  final String startTime;
  final String endTime;
  final String venue;
  final String date;

  TimeLineModel(
      {required this.id,
      required this.date,
      required this.endTime,
      required this.eventName,
      required this.startTime,
      required this.venue});

  factory TimeLineModel.fromJson(Map<String, dynamic> json) {
    return TimeLineModel(
      id: json['id'] ?? 0,
      eventName: json['eventName'] ?? "",
      startTime: json['startTime'] ?? "",
      endTime: json['endTime'] ?? "",
      date: json['startDate'] ?? "",
      venue: json['venue'] ?? "",
    );
  }
}
