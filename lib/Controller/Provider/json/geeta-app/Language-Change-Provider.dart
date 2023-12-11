import 'package:flutter/foundation.dart';

import '../../../../Modals/json/Geeta-App/language_change_modal_for_all_chepter.dart';

class Language_Change_Provider extends ChangeNotifier {
  Language_Change_Modal language_change_modal =
      Language_Change_Modal(changeLanguage: false);

  changeLanguage() {
    language_change_modal.changeLanguage =
        !language_change_modal.changeLanguage;
    notifyListeners();
  }
}
