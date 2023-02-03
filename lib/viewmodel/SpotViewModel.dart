import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/MunicipalityModel.dart';

class SpotNotifier extends StateNotifier<Map<String, Spot>>{
  SpotNotifier() : super({});

  void refreshSpot(Map<String, Spot> spot) {
    state = {};
    state = spot;
  }
}

final spotProvider = StateNotifierProvider<SpotNotifier, Map<String, Spot>>((ref) {
  return SpotNotifier();
});