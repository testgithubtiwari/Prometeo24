import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo/models/timeline_models.dart';

Future<List<TimeLineModel>> fetchTimeLines() async {
  final response = await http
      .get(Uri.parse('http://172.31.45.244:8000/prometeo/timelines/'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<TimeLineModel> timeLines =
        data.map((json) => TimeLineModel.fromJson(json)).toList();

    return timeLines;
  } else {
    throw Exception('Failed to load time lines');
  }
}
