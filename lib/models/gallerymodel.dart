class GalleryItem {
  final int id;
  final String name;
  final String description;
  final String type;
  final String image;
  final String? video; // Nullable String for potentially null fields
  final int rank;
  final bool hidden;

  GalleryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.image,
    required this.video,
    required this.rank,
    required this.hidden,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      type: json['type'] ?? "image",
      image: json['image'] ?? "",
      video: json['video'] ?? "",
      rank: json['rank'] ?? 0,
      hidden: json['hidden'] ?? false,
    );
  }
}
