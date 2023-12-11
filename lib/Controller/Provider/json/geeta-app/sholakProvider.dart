import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../../../Modals/json/Geeta-App/all-chepter-modal.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';
import '../../../../Modals/json/Geeta-App/sholak_modal.dart';

class Chapter_Provider extends ChangeNotifier {
  ShlokJsonDecodeModel shlokJsonDecodeModel =
      ShlokJsonDecodeModel(data: '', decodedList: [], allShloks: []);
  // List<AllChepter> list = [];
  Future<void> loadJsondata(List<AllChepter> list) async {
    shlokJsonDecodeModel.data =
        await rootBundle.loadString("${list[chapterIndex].jsonPath}");
    print(shlokJsonDecodeModel.allShloks);

    shlokJsonDecodeModel.decodedList = jsonDecode(shlokJsonDecodeModel.data);
    shlokJsonDecodeModel.allShloks = shlokJsonDecodeModel.decodedList
        .map((e) => ChapterModal.fromJson(json: e))
        .toList();
    notifyListeners();
  }

  englishLanuage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].en;
    notifyListeners();
  }

  gujaratiLanuage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].guj;
    notifyListeners();
  }

  hindiLanuage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].hi;
    notifyListeners();
  }
}
