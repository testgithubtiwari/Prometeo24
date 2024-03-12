// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';
import 'package:prometeo/data/event.dart';
import 'package:prometeo/models/event_model.dart';

Future<List<Event>> fetchEventData() async {
  final response = await http.get(Uri.parse(urlEventsDataMain),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    List<Event> events = getEventData();
    return events;
    // List<Event> events = List<Event>.from(
    //   json
    //       .decode(utf8.decode(response.bodyBytes))
    //       .map((data) => Event.fromJson(data)),
    // );

    // return events;
  } else {
    throw Exception('Failed to load event data');
  }
}
