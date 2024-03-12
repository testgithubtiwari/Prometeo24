import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';

import 'package:prometeo/models/updates_model.dart';

Future<List<Updates>> fetchUpdates() async {
  final response = await http.get(Uri.parse(urlUpdatesLocal));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Updates> updatesList =
        data.map((update) => Updates.fromJson(update)).toList();
    return updatesList.reversed.toList();
  } else {
    throw Exception('Failed to load updates');
  }
}
