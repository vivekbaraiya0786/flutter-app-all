import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Modals/json/Geeta-App/all-chepter-modal.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';

class AllChepterProvider extends ChangeNotifier {
  JsonDecodeModal jsonDecodeModal =
      JsonDecodeModal(data: '', decodeList: [], allChepter: []);

  Future<void> loadJson() async {
    jsonDecodeModal.data = await rootBundle
        .loadString("Assets/geeta-app-data/data/all_chepter.json");

    jsonDecodeModal.decodeList = jsonDecode(jsonDecodeModal.data);
    jsonDecodeModal.allChepter = jsonDecodeModal.decodeList
        .map((e) => AllChepter.fromJson(json: e))
        .toList();
    notifyListeners();
  }
}
