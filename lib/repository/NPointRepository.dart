import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MunicipalityModel.dart';


class NPointRepository{
  Future<MunicipalitiesModel> makeApiCall() async {
    var response = await http.get(Uri.parse('https://api.npoint.io/624fab542faa2bafcf59'));
    if (response.statusCode == 200) {
      //print(response.body);
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      final location = MunicipalitiesModel.fromJson(jsonData);
      return location;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    return MunicipalitiesModel(municipalities: {});
  }
}