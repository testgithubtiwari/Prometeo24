import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';
import 'package:prometeo/models/gallerymodel.dart';

Future<List<GalleryItem>> fetchMedia() async {
  final response = await http.get(Uri.parse(urlGalleryLocal));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> data = jsonResponse[''] as List;
    List<GalleryItem> mediaList =
        data.map((item) => GalleryItem.fromJson(item)).toList();
    return mediaList;
  } else {
    throw Exception('Failed to load media');
  }
}
