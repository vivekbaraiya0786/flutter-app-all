import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Modals/api/fitness-app/fitness_modal.dart';
import '../../../Modals/api/logo-app/logo_nodal.dart';
import '../../../Modals/api/news_app/news_modal.dart';
import '../../../Modals/api/qoutes_app_api/qoute_modal.dart';

class Api_Helper {
  Api_Helper._();

  static final Api_Helper api_helper = Api_Helper._();

  Future<List<FitnessModal>?> fetchFitnessData(String name) async {
    String startPoint = "https://api.api-ninjas.com/v1/exercises?muscle=";
    String endPoint = "$name";

    String BaseUrl = startPoint + endPoint;

    http.Response res = await http.get(Uri.parse(BaseUrl),
        headers: {'X-Api-Key': 'n0y1ZWIeOyiApxexAqMVOw==lgGjxx9PdupZMebd'});

    if (res.statusCode == 200) {
      String data = res.body;
      // print(data);
      List decodeData = jsonDecode(data);
      // print(decodeData);
      List<FitnessModal>? fitnessModal =
          decodeData.map((e) => FitnessModal.fromJson(json: e)).toList();
      return fitnessModal;
    }
  }

  Future<List<QoutesModal>?> fetchQuotesData(String name) async {
    String startPoint = "https://api.api-ninjas.com/v1/quotes?category=";
    String endPoint = "$name";

    String BaseUrl = startPoint + endPoint;

    http.Response res = await http.get(Uri.parse(BaseUrl),
        headers: {'X-Api-Key': 'n0y1ZWIeOyiApxexAqMVOw==lgGjxx9PdupZMebd'});

    if (res.statusCode == 200) {
      String data = res.body;
      // print(data);
      List decodeData = jsonDecode(data);
      // print(decodeData);
      List<QoutesModal>? qoutemodal =
          decodeData.map((e) => QoutesModal.fromJson(json: e)).toList();
      return qoutemodal;
    }
  }

  Future<List<LogoModal>?> getLogo(String name) async {
    String start = "https://api.api-ninjas.com/v1/logo?name=";
    String end = name;

    String baseurl = start + end;

    http.Response res = await http.get(Uri.parse(baseurl),
        headers: {'X-Api-Key': 'n0y1ZWIeOyiApxexAqMVOw==lgGjxx9PdupZMebd'});

    if (res.statusCode == 200) {
      String data = res.body;
      List decodeData = jsonDecode(data);
      List<LogoModal>? logo =
          decodeData.map((e) => LogoModal.fromJson(json: e)).toList();
      return logo;
    }
  }

  Future<NewsModal?> fetchNews(
      String country, String category, String language) async {
    String Url =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&language=$language&apiKey=0def7ed3a22546e9856497b1cba6ae5c";
    http.Response res = await http.get(Uri.parse(Url));

    if (res.statusCode == 200) {
      String data = res.body;
      Map decodeData = jsonDecode(data);
      NewsModal? news = NewsModal.fromJson(json: decodeData);
      return news;
    }
  }
}
