class Event {
  final int id;
  final String designation;
  final String name;
  final String image;
  final String rulebook;
  // final String problemStatement;
  // final String participationType;
  // final int minTeamSize;
  // final int maxTeamSize;
  final String prize;
  final String description;
  final String date;
  final String unstopLink;
  final String time;
  final String endDate;
  final String endTime;
  final String startTime;
  final String venue;
  // final bool registrationOpen;
  final String type;
  // final bool eventStarted;

  Event({
    required this.startTime,
    required this.designation,
    required this.id,
    required this.name,
    required this.image,
    required this.rulebook,
    // required this.problemStatement,
    // required this.participationType,
    // required this.minTeamSize,
    // required this.maxTeamSize,
    required this.prize,
    required this.description,
    required this.date,
    required this.time,
    required this.unstopLink,
    required this.endDate,
    required this.endTime,
    required this.venue,
    // required this.registrationOpen,
    required this.type,
    // required this.eventStarted,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      startTime: json['time'] ?? "",
      designation:
          json['designation'] != null ? json['designation'] as String : "",
      unstopLink: json['external_link'] ?? "",
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      rulebook: json['rulebook'] ?? "",
      // problemStatement: json['problem_statement'] ?? "",
      // participationType: json['participation_type'] ?? "",
      // minTeamSize: json['min_team_size'] ?? 0,
      // maxTeamSize: json['max_team_size'] ?? 0,
      prize: json['prize'] ?? "",
      description: json['description'] ?? "",
      date: json['date'] ?? "",
      time: json['time'] ?? "",
      endDate: json['end_date'] ?? "",
      endTime: json['end_time'] ?? "",
      venue: json['venue'] ?? "",
      // registrationOpen: json['registration_open'] ?? false,
      type: json['type'] ?? "",
      // eventStarted: json['event_started'] ?? false,
    );
  }
}
