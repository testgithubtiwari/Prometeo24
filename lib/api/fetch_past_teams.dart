import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';
import 'dart:convert';
import 'package:prometeo/models/teams_model.dart';

Future<Map<String, List<Teams>>> fetchPastTeams() async {
  final response = await http.get(Uri.parse(urlPastTeamsMain));
  if (response.statusCode == 200) {
    // print(response);
    final Map<String, dynamic> data = json.decode(response.body);
    List<Teams> publicRelations;
    if (data['Past-Team']['Public Relations'] != null) {
      publicRelations = (data['Past-Team']['Public Relations'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      publicRelations = [];
    }
    List<Teams> aTS;
    if (data['Past-Team']['ATS'] != null) {
      aTS = (data['Past-Team']['ATS'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      aTS = [];
    }
    List<Teams> coordinator;
    if (data['Past-Team']['Coordinator'] != null) {
      coordinator = (data['Past-Team']['Coordinator'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      coordinator = [];
    }

    List<Teams> technicalEvent;
    if (data['Past-Team']['Technical Events'] != null) {
      technicalEvent = (data['Past-Team']['Technical Events'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      technicalEvent = [];
    }

    List<Teams> contentWriting;
    if (data['Past-Team']['Content Writing'] != null) {
      contentWriting = (data['Past-Team']['Content Writing'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      contentWriting = [];
    }

    List<Teams> enterPreneurshipEvents;
    if (data['Past-Team']['Entrepreneurship Events'] != null) {
      enterPreneurshipEvents =
          (data['Past-Team']['Entrepreneurship Events'] as List)
              .map((json) => Teams.fromJson(json))
              .toList();
    } else {
      enterPreneurshipEvents = [];
    }

    List<Teams> exhibition;
    if (data['Past-Team']['Exhibition'] != null) {
      exhibition = (data['Past-Team']['Exhibition'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      exhibition = [];
    }

    List<Teams> informalEvents;
    if (data['Past-Team']['Informal Events'] != null) {
      informalEvents = (data['Past-Team']['Informal Events'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      informalEvents = [];
    }

    List<Teams> pronite;
    if (data['Past-Team']['Pronite'] != null) {
      pronite = (data['Past-Team']['Pronite'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      pronite = [];
    }

    List<Teams> marketing;
    if (data['Past-Team']['Marketing'] != null) {
      marketing = (data['Past-Team']['Marketing'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      marketing = [];
    }

    List<Teams> dNC;
    if (data['Past-Team']['Design and Creativity'] != null) {
      dNC = (data['Past-Team']['Design and Creativity'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      dNC = [];
    }

    List<Teams> webD;
    if (data['Past-Team']['Web Development'] != null) {
      webD = (data['Past-Team']['Web Development'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      webD = [];
    }

    List<Teams> appD;
    if (data['Past-Team']['App Development'] != null) {
      appD = (data['Past-Team']['App Development'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      appD = [];
    }

    List<Teams> pNM;
    if (data['Past-Team']['Publicity and Media'] != null) {
      pNM = (data['Past-Team']['Publicity and Media'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      pNM = [];
    }

    List<Teams> resources;
    if (data['Past-Team']['Resources'] != null) {
      resources = (data['Past-Team']['Resources'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      resources = [];
    }

    List<Teams> festivalChief;
    if (data['Past-Team']['Festival Chiefs'] != null) {
      festivalChief = (data['Past-Team']['Festival Chiefs'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      festivalChief = [];
    }

    Map<String, List<Teams>> pastTeams = {
      'publicRelations': publicRelations,
      'ats': aTS,
      'technicalEvents': technicalEvent,
      'contentWriting': contentWriting,
      'enterPreneurshipEvents': enterPreneurshipEvents,
      'exhibition': exhibition,
      'informalEvents': informalEvents,
      'coordinator': coordinator,
      'webD': webD,
      'appD': appD,
      'pNM': pNM,
      'resources': resources,
      'festivalChief': festivalChief,
      'pronite': pronite,
      'dNC': dNC,
      'marketing': marketing,
    };
    return pastTeams;
  } else {
    throw Exception('PastTeams data is null in the API response');
  }
}
