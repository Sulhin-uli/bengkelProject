import 'dart:convert';

import 'package:projek_bengkel/core/models/stall_model.dart';

class MekanikModel {
  int? id;
  String? name;
  String? image;
  StallModel? stall;
  String? plat;
  bool? isProgress;

  MekanikModel({
    this.id,
    this.name,
    this.image,
    this.stall,
    this.plat,
    this.isProgress,
  });

  static Map<String, dynamic> toMap(MekanikModel mekanik) => {
        'id': mekanik.id,
        "name": mekanik.name,
        "image": mekanik.image,
        "stall": mekanik.stall!.id,
        "plat": mekanik.plat,
      };

  static String encode(List<MekanikModel> mekaniks) => json.encode(
        mekaniks
            .map<Map<String, dynamic>>((mekanik) => MekanikModel.toMap(mekanik))
            .toList(),
      );
}
