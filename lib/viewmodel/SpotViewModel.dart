import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/MunicipalityModel.dart';

class SpotNotifier extends StateNotifier<Map<String, dynamic>>{
  SpotNotifier() : super({});

  void refreshSpot(Map<String, Spot> spot, name) {
    var muni = name;
    state = {};
    state = {
      "municipality": muni,
      "spots": spot,
    };
  }
}

final spotProvider = StateNotifierProvider<SpotNotifier, Map<String, dynamic>>((ref) {
  return SpotNotifier();
});