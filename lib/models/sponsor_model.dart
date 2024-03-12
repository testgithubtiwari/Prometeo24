// ignore_for_file: prefer_if_null_operators

class SponsorModel {
  final int id;
  final String image;
  final String name;
  final String sponsorLink;
  final int designation;
  final String designationName;

  SponsorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.sponsorLink,
    required this.designation,
    required this.designationName,
  });

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      id: json['id'] ?? 1,
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      sponsorLink: json['sponsor_link'] != null ? json['sponsor_link'] : "",
      designation: json['designation'] ?? 22,
      designationName: json['designation_name'] ?? "",
    );
  }
}
