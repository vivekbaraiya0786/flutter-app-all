import 'package:flutter/cupertino.dart';

import '../../../../Modals/api/qoutes_app_api/qoute_modal.dart';
import '../../../../helper/api/api_helper/api_helper.dart';

class qoute_app_proivder extends ChangeNotifier {
  String name = "age";

  searchResult(String value) {
    name = value;
    notifyListeners();
  }

  Future<List<QoutesModal>?> fetchqouteData(String name) async {
    List<QoutesModal>? qoutesModal =
        await Api_Helper.api_helper.fetchQuotesData(name);
    return qoutesModal;
  }
}
