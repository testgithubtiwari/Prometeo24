class Teams {
  final int id;
  final String name;
  final String image;
  final String githubLink;
  final String instagramLink;
  final String facebookLink;
  final String linkedinLink;
  final String email;
  final String phoneNumber;
  final int vertical;
  final String verticalName;

  Teams({
    required this.id,
    required this.name,
    required this.githubLink,
    required this.instagramLink,
    required this.facebookLink,
    required this.image,
    required this.linkedinLink,
    required this.email,
    required this.phoneNumber,
    required this.vertical,
    required this.verticalName,
  });

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      id: json['id'] ?? 0,
      // ignore: prefer_if_null_operators
      image: json['image'] != null ? json['image'] : "",
      name: json['name'] ?? "",
      githubLink: json['github_link'] ?? "",
      instagramLink: json['instagram_link'] ?? "",
      facebookLink: json['facebook_link'] ?? "",
      linkedinLink: json['linkedin_link'] ?? "",
      email: json['email'] ?? "",
      phoneNumber: json['phoneNo'] ?? "",
      vertical: json['vertical'] ?? 0,
      verticalName: json['vertical_name'] ?? "",
    );
  }
}
