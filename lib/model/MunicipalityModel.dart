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
  final Map<String, Spot> spots;

  Municipality({required this.name, required this.spots});

  factory Municipality.fromJson(String name, Map<String, dynamic> json) {
    Map<String, Spot> spots = {};
    json['Spots'].forEach((name, data) {
      spots[name] = Spot.fromJson(name, data);
    });
    return Municipality(name: name, spots: spots);
  }
}

class Spot {
  final String name;
  final List<String> pictures;
  final List<String> guides;
  final List<String> eateries;
  final String coords;
  final List<String> tips;
  final String description;


  Spot({required this.name, required this.pictures, required this.guides, required this.eateries, required this.coords, required this.tips,required this.description});

  factory Spot.fromJson(String name, Map<String, dynamic> json) {
    return Spot(
      name: name,
      pictures: List<String>.from(json['Pictures']),
      guides: List<String>.from(json['Guides']),
      eateries: List<String>.from(json['Eateries']),
      coords: json["Coords"],
      tips: List<String>.from(json['Tips']),
      description: json['Description'],
    );
  }
}
