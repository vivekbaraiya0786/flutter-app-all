import 'package:projects/Modals/json/Geeta-App/sholak_modal.dart';

import 'all-chepter-modal.dart';

class JsonDecodeModal {
  String data;
  List decodeList;
  List<AllChepter> allChepter;

  JsonDecodeModal({
    required this.data,
    required this.decodeList,
    required this.allChepter,
  });
}

class ShlokJsonDecodeModel {
  String data;
  List decodedList;
  List<ChapterModal> allShloks;

  ShlokJsonDecodeModel({
    required this.data,
    required this.decodedList,
    required this.allShloks,
  });
}

int chapterIndex = 0;
int shlokIndex = 0;
