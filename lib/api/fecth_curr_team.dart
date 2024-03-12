import 'package:http/http.dart' as http;
import 'package:prometeo/constants.dart';
import 'dart:convert';
import 'package:prometeo/models/teams_model.dart';

Future<Map<String, List<Teams>>> fetchCurrTeam() async {
  final response = await http.get(Uri.parse(urlCurrTeamsMain));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    List<Teams> publicRelations;
    if (data['Current-Team']['Public Relations'] != null) {
      publicRelations = (data['Current-Team']['Public Relations'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      publicRelations = [];
    }
    List<Teams> aTS;
    if (data['Current-Team']['ATS'] != null) {
      aTS = (data['Current-Team']['ATS'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      aTS = [];
    }
    List<Teams> eConclave;
    if (data['Current-Team']['E-Conclave'] != null) {
      eConclave = (data['Current-Team']['E-Conclave'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      eConclave = [];
    }
    List<Teams> coordinator;
    if (data['Current-Team']['Coordinator'] != null) {
      coordinator = (data['Current-Team']['Coordinator'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      coordinator = [];
    }

    List<Teams> technicalEvent;
    if (data['Current-Team']['Technical Events'] != null) {
      technicalEvent = (data['Current-Team']['Technical Events'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      technicalEvent = [];
    }

    List<Teams> contentWriting;
    if (data['Current-Team']['Content Writing'] != null) {
      contentWriting = (data['Current-Team']['Content Writing'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      contentWriting = [];
    }

    List<Teams> enterPreneurshipEvents;
    if (data['Current-Team']['Entrepreneurship Events'] != null) {
      enterPreneurshipEvents =
          (data['Current-Team']['Entrepreneurship Events'] as List)
              .map((json) => Teams.fromJson(json))
              .toList();
    } else {
      enterPreneurshipEvents = [];
    }

    List<Teams> exhibition;
    if (data['Current-Team']['Exhibition'] != null) {
      exhibition = (data['Current-Team']['Exhibition'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      exhibition = [];
    }

    List<Teams> informalEvents;
    if (data['Current-Team']['Informal Events'] != null) {
      informalEvents = (data['Current-Team']['Informal Events'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      informalEvents = [];
    }

    List<Teams> pronite;
    if (data['Current-Team']['Pronite'] != null) {
      pronite = (data['Current-Team']['Pronite'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      pronite = [];
    }

    List<Teams> marketing;
    if (data['Current-Team']['Marketing'] != null) {
      marketing = (data['Current-Team']['Marketing'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      marketing = [];
    }

    List<Teams> dNC;
    if (data['Current-Team']['Design and Creativity'] != null) {
      dNC = (data['Current-Team']['Design and Creativity'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      dNC = [];
    }

    List<Teams> webD;
    if (data['Current-Team']['Web Development'] != null) {
      webD = (data['Current-Team']['Web Development'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      webD = [];
    }

    List<Teams> appD;
    if (data['Current-Team']['App Development'] != null) {
      appD = (data['Current-Team']['App Development'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      appD = [];
    }

    List<Teams> pNM;
    if (data['Current-Team']['Publicity and Media'] != null) {
      pNM = (data['Current-Team']['Publicity and Media'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      pNM = [];
    }

    List<Teams> resources;
    if (data['Current-Team']['Resources'] != null) {
      resources = (data['Current-Team']['Resources'] as List)
          .map((json) => Teams.fromJson(json))
          .toList();
    } else {
      resources = [];
    }

    List<Teams> festivalChief;
    if (data['Current-Team']['Festival Chiefs'] != null) {
      festivalChief = (data['Current-Team']['Festival Chiefs'] as List)
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
      'econclave': eConclave,
    };
    return pastTeams;
  } else {
    throw Exception('PastTeams data is null in the API response');
  }
}
