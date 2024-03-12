// import 'package:http/http.dart' as http;
// import 'package:prometeo/constants.dart';
import 'package:prometeo/data/sponsors.dart';
// import 'dart:convert';
import 'package:prometeo/models/sponsor_model.dart';

Future<Map<String, List<SponsorModel>>> fetchSponsors() async {
  // final response = await http.get(Uri.parse(urlSponsorsMain));
  // if (response.statusCode == 200) {
  // final Map<String, dynamic> data = json.decode(response.body);
  final Map<String, dynamic> data = hardcodedSponsors;
  List<SponsorModel> titleSponsors;
  if (data['Sponsors']['TITLE SPONSOR'] != null) {
    titleSponsors = (data['Sponsors']['TITLE SPONSOR'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    titleSponsors = [];
  }
  List<SponsorModel> coTitleSponsor;
  if (data['Sponsors']['CO-TITLE SPONSOR'] != null) {
    coTitleSponsor = (data['Sponsors']['CO-TITLE SPONSOR'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    coTitleSponsor = [];
  }
  List<SponsorModel> associateSponsors;
  if (data['Sponsors']['Associate Sponsor'] != null) {
    associateSponsors = (data['Sponsors']['Associate Sponsor'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    associateSponsors = [];
  }
  List<SponsorModel> poweredBy;
  if (data['Sponsors']['POWERED BY'] != null) {
    poweredBy = (data['Sponsors']['POWERED BY'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    poweredBy = [];
  }
  List<SponsorModel> learningPartner;
  if (data['Sponsors']['LEARNING PARTNER'] != null) {
    learningPartner = (data['Sponsors']['LEARNING PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    learningPartner = [];
  }
  List<SponsorModel> logoPartner;
  if (data['Sponsors']['LOGO PARTNER'] != null) {
    logoPartner = (data['Sponsors']['LOGO PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    logoPartner = [];
  }
  List<SponsorModel> acceleratedByPartner;
  if (data['Sponsors']['ACCELERATED BY PARTNER'] != null) {
    acceleratedByPartner = (data['Sponsors']['ACCELERATED BY PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    acceleratedByPartner = [];
  }
  List<SponsorModel> esportsPartner;
  if (data['Sponsors']['E-SPORTS PARTNER'] != null) {
    esportsPartner = (data['Sponsors']['E-SPORTS PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    esportsPartner = [];
  }
  List<SponsorModel> radioPartner;
  if (data['Sponsors']['RADIO PARTNER'] != null) {
    radioPartner = (data['Sponsors']['RADIO PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    radioPartner = [];
  }
  List<SponsorModel> couponPartner;
  if (data['Sponsors']['COUPON PARTNER'] != null) {
    couponPartner = (data['Sponsors']['COUPON PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    couponPartner = [];
  }
  List<SponsorModel> educationPartner;
  if (data['Sponsors']['EDUCATION PARTNER'] != null) {
    educationPartner = (data['Sponsors']['EDUCATION PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    educationPartner = [];
  }
  List<SponsorModel> onlineMediaSponsors;
  if (data['Sponsors']['ONLINE MEDIA PARTNER'] != null) {
    onlineMediaSponsors = (data['Sponsors']['ONLINE MEDIA PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    onlineMediaSponsors = [];
  }

  List<SponsorModel> consultancyPartner;
  if (data['Sponsors']['CONSULTANCY PARTNER'] != null) {
    consultancyPartner = (data['Sponsors']['CONSULTANCY PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    consultancyPartner = [];
  }

  List<SponsorModel> technicalEventsPartner;
  if (data['Sponsors']['TECHNICAL EVENTS PARTNER'] != null) {
    technicalEventsPartner =
        (data['Sponsors']['TECHNICAL EVENTS PARTNER'] as List)
            .map((json) => SponsorModel.fromJson(json))
            .toList();
  } else {
    technicalEventsPartner = [];
  }
  List<SponsorModel> vCPartner;
  if (data['Sponsors']['VC PARTNER'] != null) {
    vCPartner = (data['Sponsors']['VC PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    vCPartner = [];
  }
  List<SponsorModel> workshopPartner;
  if (data['Sponsors']['WORKSHOP PARTNER'] != null) {
    workshopPartner = (data['Sponsors']['WORKSHOP PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    workshopPartner = [];
  }
  List<SponsorModel> servicesPartner;
  if (data['Sponsors']['SERVICE PROVIDER'] != null) {
    servicesPartner = (data['Sponsors']['SERVICES PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    servicesPartner = [];
  }
  List<SponsorModel> entertainmentPartner;
  if (data['Sponsors']['ENTERTAINMENT PARTNER'] != null) {
    entertainmentPartner = (data['Sponsors']['ENTERTAINMENT PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    entertainmentPartner = [];
  }
  List<SponsorModel> giftingsPartner;
  if (data['Sponsors']['GIFTING SPONSOR'] != null) {
    giftingsPartner = (data['Sponsors']['GIFTING PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    giftingsPartner = [];
  }
  List<SponsorModel> digitalMediaPartner;
  if (data['Sponsors']['DIGITAL MEDIA PARTNER'] != null) {
    digitalMediaPartner = (data['Sponsors']['DIGITAL MEDIA PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    digitalMediaPartner = [];
  }
  List<SponsorModel> printingPartner;
  if (data['Sponsors']['PRINTING PARTNER'] != null) {
    printingPartner = (data['Sponsors']['PRINTING PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    printingPartner = [];
  }
  List<SponsorModel> mediaPartner;
  if (data['Sponsors']['ONLINE MEDIA PARTNER'] != null) {
    mediaPartner = (data['Sponsors']['ONLINE MEDIA PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    mediaPartner = [];
  }
  List<SponsorModel> merchandisePartner;
  if (data['Sponsors']['MERCHANDISE PARTNER'] != null) {
    merchandisePartner = (data['Sponsors']['MERCHANDISE PARTNER'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    merchandisePartner = [];
  }
  List<SponsorModel> travelPartner;
  if (data['Sponsors']['Travel Partner'] != null) {
    travelPartner = (data['Sponsors']['Travel Partner'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    travelPartner = [];
  }
  List<SponsorModel> sociallyResponsiblePartner;
  if (data['Sponsors']['SOCIAL RESPONSIBILITY PARTNER'] != null) {
    sociallyResponsiblePartner =
        (data['Sponsors']['SOCIAL RESPONSIBILITY PARTNER'] as List)
            .map((json) => SponsorModel.fromJson(json))
            .toList();
  } else {
    sociallyResponsiblePartner = [];
  }
  List<SponsorModel> arcadePartner;
  if (data['Sponsors']['Arcade Partner'] != null) {
    arcadePartner = (data['Sponsors']['Arcade Partner'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    arcadePartner = [];
  }
  List<SponsorModel> rcpartner;
  if (data['Sponsors']['Nitro RC racing event partner'] != null) {
    rcpartner = (data['Sponsors']['Nitro RC racing event partner'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    rcpartner = [];
  }
  List<SponsorModel> fashionpartner;
  if (data['Sponsors']['Fashion Partner'] != null) {
    fashionpartner = (data['Sponsors']['Fashion Partner'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    fashionpartner = [];
  }
  List<SponsorModel> jijoYouthpartner;
  if (data['Sponsors']['JITO Youth'] != null) {
    jijoYouthpartner = (data['Sponsors']['JITO Youth'] as List)
        .map((json) => SponsorModel.fromJson(json))
        .toList();
  } else {
    jijoYouthpartner = [];
  }
  List<SponsorModel> rcPlaneShowpartner;
  if (data['Sponsors']['RC  plane show ka Event Sponsor'] != null) {
    rcPlaneShowpartner =
        (data['Sponsors']['RC  plane show ka Event Sponsor'] as List)
            .map((json) => SponsorModel.fromJson(json))
            .toList();
  } else {
    rcPlaneShowpartner = [];
  }

  Map<String, List<SponsorModel>> sponsors = {
    'rcPlaneShowpartner': rcPlaneShowpartner,
    'jijoYouthpartner': jijoYouthpartner,
    'fashionpartner': fashionpartner,
    'arcadePartner': arcadePartner,
    'sociallyResponsiblePartner': sociallyResponsiblePartner,
    'travelPartner': travelPartner,
    'rcpartner': rcpartner,
    'Title Sponsors': titleSponsors,
    'Co-Title Sponsors': coTitleSponsor,
    'associateSponsors': associateSponsors,
    'poweredBy': poweredBy,
    'learningPartner': learningPartner,
    'logoPartner': logoPartner,
    'acceleratedByPartner': acceleratedByPartner,
    'esportsPartner': esportsPartner,
    'radioPartner': radioPartner,
    'couponPartner': couponPartner,
    'educationPartner': educationPartner,
    'onlineMediaSponsors': onlineMediaSponsors,
    'consultancyPartner': consultancyPartner,
    'technicalEventsPartner': technicalEventsPartner,
    'vCPartner': vCPartner,
    'workshopPartner': workshopPartner,
    'servicesPartner': servicesPartner,
    'entertainmentPartner': entertainmentPartner,
    'giftingsPartner': giftingsPartner,
    'digitalMediaPartner': digitalMediaPartner,
    'printingPartner': printingPartner,
    'onlinemediaPartner': mediaPartner,
    'merchandisePartner': merchandisePartner,
  };

  return sponsors;
  // } else {
  //   throw Exception('Sponsors data is null in the API response');
  // }
// }
}
