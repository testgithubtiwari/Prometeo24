class Updates {
  final int id;
  final String updatestype;
  final String news;

  Updates({required this.id, required this.news, required this.updatestype});

  factory Updates.fromJson(Map<String, dynamic> json) {
    return Updates(
      id: json['id'],
      updatestype: json['updatestype'] ?? "",
      news: json['news'] ?? "",
    );
  }
}
