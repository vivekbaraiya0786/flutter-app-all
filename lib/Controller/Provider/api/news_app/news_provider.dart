import 'package:flutter/cupertino.dart';

import '../../../../Modals/api/news_app/news_modal.dart';
import '../../../../helper/api/api_helper/api_helper.dart';

class news_Provider extends ChangeNotifier {
  String country = "in";
  String category = "business";
  String language = "en";

  chooseCountry(String value) {
    country = value;
    notifyListeners();
  }

  chooseCategory(String value) {
    category = value;
    notifyListeners();
  }

  chooseLanguage(String value) {
    language = value;
    notifyListeners();
  }

  Future<NewsModal?> fetchData(
      String country, String category, String language) async {
    NewsModal? news =
        await Api_Helper.api_helper.fetchNews(country, category, language);
    return news;
  }
}
