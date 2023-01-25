
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nvtours/model/MunicipalityModel.dart';
import 'package:nvtours/repository/NPointRepository.dart';

final municipalityProvider = FutureProvider<MunicipalitiesModel>((ref)async{
  MunicipalitiesModel municipalities = await NPointRepository().makeApiCall();
  print(municipalities.municipalities["Kayapa"]!.spots);
  return municipalities;
});