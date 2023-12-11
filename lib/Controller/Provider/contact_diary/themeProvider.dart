import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Modals/contact_diary/themeModal.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeModal themeModal = ThemeModal(isDarkMode: false);
  //
  // void changeTheme() {
  //   themeModal.isDarkMode = !themeModal.isDarkMode;
  //   notifyListeners();
  // }

  ThemeModal themeModal;

  ThemeProvider({required this.themeModal});

  void changeTheme() async {
    themeModal.isDarkMode = !themeModal.isDarkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', themeModal.isDarkMode);
    notifyListeners();
  }
}
