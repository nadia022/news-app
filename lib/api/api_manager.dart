import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/endpoints.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=ec7981f7c9354d848b1ad23dbdb8663b

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, Endpoints.sourceApi,
        {'apiKey': ApiConstants.apiKey});
    var response = await http.get(url);
    try {
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=ec7981f7c9354d848b1ad23dbdb8663b

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, Endpoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
