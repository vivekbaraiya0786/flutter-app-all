import 'package:flutter/cupertino.dart';

import '../../../../Modals/api/logo-app/logo_nodal.dart';
import '../../../../helper/api/api_helper/api_helper.dart';

class LogoProvider extends ChangeNotifier {
  String search = "Google";

  void serachResult(String value) {
    search = value;
    notifyListeners();
  }

  Future<List<LogoModal>?> fetchData(String search) async {
    List<LogoModal>? logoModal = await Api_Helper.api_helper.getLogo(search);
    return logoModal;
  }
}
