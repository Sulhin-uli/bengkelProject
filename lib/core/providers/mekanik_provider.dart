import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_bengkel/core/models/mekanik_model.dart';
import 'package:projek_bengkel/core/models/stall_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class MekanikProvider with ChangeNotifier {
  final box = GetStorage();
  String get quote {
    return box.read('quote');
  }

  void makeData() {
    box.write('mekanik-1', {
      "stallId": 1,
      "StallCode": "DIAG 1",
      "plat": "B 1234 YOS",
      "isProgress": true,
    });
  }

  List<StallModel> _allStall = [
    StallModel(id: 1, code: "DIAG 1"),
    StallModel(id: 2, code: "DIAG 2"),
    StallModel(id: 3, code: "EM 1"),
    StallModel(id: 4, code: "EM 2"),
    StallModel(id: 5, code: "SBE 1"),
    StallModel(id: 6, code: "SBE 2"),
    StallModel(id: 7, code: "SBE 3"),
    StallModel(id: 8, code: "SBE 4"),
    StallModel(id: 9, code: "SBE 5"),
    StallModel(id: 10, code: "SBI 1"),
    StallModel(id: 11, code: "SBI 2"),
    StallModel(id: 12, code: "ES 1"),
    StallModel(id: 13, code: "ES 2"),
    StallModel(id: 14, code: "ES 3"),
    StallModel(id: 15, code: "ES 4"),
    StallModel(id: 16, code: "ES 5"),
    StallModel(id: 17, code: "GR 1"),
    StallModel(id: 18, code: "GR 2/LUBING"),
    StallModel(id: 19, code: "GR 3 "),
    StallModel(id: 20, code: "GR 4"),
    StallModel(id: 21, code: "GR 5"),
    StallModel(id: 22, code: "GR 6"),
    StallModel(id: 23, code: "GR 7"),
    StallModel(id: 24, code: "GR 8"),
    StallModel(id: 25, code: "GR 9/DIO"),
    StallModel(id: 26, code: "DYNA 1"),
    StallModel(id: 27, code: "DYNA 2"),
    StallModel(id: 28, code: "JOB STOPPAGE"),
    StallModel(id: 29, code: "LOAD"),
  ];
  List<MekanikModel> _allMekanik = [
    MekanikModel(
      id: 1,
      name: "ABDUL ROHMAN Sr",
      image: "assets/m1.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 2,
      name: "ACHMADIYAH",
      image: "assets/m2.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 3,
      name: "ACUN RUKMANA",
      image: "assets/m3.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 4,
      name: "AHMAD SOFYAN",
      image: "assets/m4.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 5,
      name: "AHMAD SUPRIYANTO",
      image: "assets/m5.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 6,
      name: "ARDIVA O H",
      image: "assets/m6.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 7,
      name: "ARI WIJAYANTO",
      image: "assets/m7.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 8,
      name: "BUDI HARYANTO",
      image: "assets/m8.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 9,
      name: "CHAMID M",
      image: "assets/m9.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 10,
      name: "DIDI WARSIDI",
      image: "assets/m10.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 11,
      name: "EKO WICAKSONO",
      image: "assets/m11.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 12,
      name: "ESTU MARGIONO",
      image: "assets/m12.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 13,
      name: "FATKHUR ROHMAN",
      image: "assets/m13.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 14,
      name: "HIZKIA PASCA S K",
      image: "assets/m14.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 15,
      name: "JAFAR SIDIQ",
      image: "assets/m15.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 16,
      name: "MAHMUDI",
      image: "assets/m16.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 17,
      name: "MIFTA FARID",
      image: "assets/m17.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 18,
      name: "PUJIANTO",
      image: "assets/m18.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 19,
      name: "RAHAYUDIN",
      image: "assets/m19.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 20,
      name: "RAHMAT WAHIDIN",
      image: "assets/m20.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 21,
      name: "RIDWAN H",
      image: "assets/m21.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 22,
      name: "SUHARDIYANTO",
      image: "assets/m22.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 23,
      name: "TARMUJI",
      image: "assets/m23.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 24,
      name: "USMAN",
      image: "assets/m14.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B2234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 25,
      name: "WAHYU ADI K",
      image: "assets/m25.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 26,
      name: "WISNU NURCAHYA",
      image: "assets/m26.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 27,
      name: "YULIANTO",
      image: "assets/m27.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
    MekanikModel(
      id: 28,
      name: "YUSUF FIRMANTO",
      image: "assets/m28.png",
      stall: StallModel(id: 1, code: "DIAG 1"),
      plat: "B 1234 YOS",
      isProgress: true,
    ),
  ];

  String? platNomor;

  String get getPlatNomor {
    return platNomor!;
  }

  set setplatNomor(String platNomor) {
    platNomor = platNomor;
  }

  List<MekanikModel> get allMekanik {
    return [..._allMekanik];
  }

  List<StallModel> get allStall {
    return [..._allStall];
  }

  MekanikModel findById(int id) {
    return _allMekanik.firstWhere((e) => e.id == id);
  }

  void updateData(
    int id,
    bool isProgress,
    String plat,
    int stallId,
    String stallCode,
  ) {
    final item = findById(id);
    item.isProgress = isProgress;
    item.plat = plat;
    item.stall = StallModel(
      id: stallId,
      code: stallCode,
    );
    notifyListeners();
  }

  void updateDataStall(
    int id,
    int stallId,
    String stallCode,
  ) {
    final item = findById(id);
    item.stall = StallModel(
      id: stallId,
      code: stallCode,
    );
    notifyListeners();
  }
}
