import 'package:flutter/material.dart';

import '../../../../Modals/api/fitness-app/fitness_modal.dart';
import '../../../../helper/api/api_helper/api_helper.dart';

class fitnessProvider extends ChangeNotifier {
  String search = "biceps";

  void searchFitnessData(String value) {
    search = value;
    notifyListeners();
  }

  Future<List<FitnessModal>?> fetchdata(String search) async {
    List<FitnessModal>? fit =
        await Api_Helper.api_helper.fetchFitnessData(search);
    return fit;
  }
}
