import 'package:flutter/cupertino.dart';
import 'package:projects/Modals/api/weather_app/weather_modal.dart';
import 'package:projects/helper/api/api_helper/api_helper.dart';

class weather_Provider extends ChangeNotifier {
  String country = "surat";
  String days = "7";

  void chooseCountry(String value) {
    country = value;
    notifyListeners();
  }

  void chooseDays(String value) {
    days = value;
    notifyListeners();
  }

  Future<WeatherModal?> fetchweather(String country, String days) async {
    WeatherModal? weatherModal =
        await Api_Helper.api_helper.fetchweather(country, days);
    notifyListeners();
    return weatherModal;
  }
}
