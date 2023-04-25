class MunicipalitiesModel {
  final Map<String, Municipality> municipalities;

  MunicipalitiesModel({required this.municipalities});

  factory MunicipalitiesModel.fromJson(Map<String, dynamic> json) {
    Map<String, Municipality> municipalities = {};
    json.forEach((name, data) {
      municipalities[name] = Municipality.fromJson(name, data);
    });
    return MunicipalitiesModel(municipalities: municipalities);
  }
}

class Municipality {
  final String name;
  final String description;
  final Map<String, Spot> spots;

  Municipality({required this.name, required this.description, required this.spots});

  factory Municipality.fromJson(String name, Map<String, dynamic> json) {
    Map<String, Spot> spots = {};
    json['Spots'].forEach((name, data) {
      spots[name] = Spot.fromJson(name, data);
    });
    return Municipality(name: name, spots: spots, description: json['desc']);
  }
}

class Spot {
  final String name;
  final List<String> pictures;
  final List<String> thumbnails;
  final List<String> guides;
  final List<String> eateries;
  final List<String> itineraries;
  final List<String> banks;
  final String coords;
  final List<String> tips;
  final String description;
  final List<String> hotlines;
  final List<String> agencies;
  final List<String> tags;


  Spot({
    required this.name,
    required this.pictures,
    required this.thumbnails,
    required this.guides,
    required this.eateries,
    required this.itineraries,
    required this.banks,
    required this.coords,
    required this.tips,
    required this.description,
    required this.hotlines,
    required this.agencies,
    required this.tags
  });

  factory Spot.fromJson(String name, Map<String, dynamic> json) {
    return Spot(
      name: name,
      pictures: List<String>.from(json['Pictures']),
      thumbnails: List<String>.from(json['Thumbnails']),
      guides: List<String>.from(json['Guides']),
      eateries: List<String>.from(json['Eateries']),
      itineraries: List<String>.from(json['itinreraries']),
      banks: List<String>.from(json['Banks']),
      coords: json["Coords"],
      tips: List<String>.from(json['Tips']),
      description: json['Description'],
      hotlines: List<String>.from(json['Hotlines']),
      agencies: List<String>.from(json['Agencies']),
      tags: List<String>.from(json['Tags']),
    );
  }
}
