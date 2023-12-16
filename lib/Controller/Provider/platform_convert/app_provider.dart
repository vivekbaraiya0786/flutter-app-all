import 'package:flutter/cupertino.dart';
import 'package:projects/Modals/platform_convert/app_modal.dart';

class App_Provider extends ChangeNotifier {
  App_Modal app_modal = App_Modal(changeApp: false);

  // App_Provider({required this.app_modal});

  changeApp() {
    app_modal.changeApp = !app_modal.changeApp;
    notifyListeners();
  }
}
