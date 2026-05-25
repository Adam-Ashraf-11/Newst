import 'package:flutter/material.dart';
import 'package:newst_app/core/data_source/services/api_config.dart';
import 'package:newst_app/core/data_source/services/api_services.dart';
import 'package:newst_app/features/home/data/models/news_model.dart';

class HomeController extends ChangeNotifier {
  bool topHeadliesLoading = true;
  bool everythingLoading = true;
  String? errorMessage;
  List<NewsModel> topHeadlinesList = [];
  List<NewsModel> everythingList = [];
  ApiServices apiServices = ApiServices();
  void init() {
    getEverything();
    getTopHeadlines();
  }

  void getTopHeadlines() async {
    try {
      topHeadliesLoading;
      Map<String, dynamic> results = await apiServices.get(
        endPoints: ApiConfig.topHeadlines,
        parames: {'country': 'us'},
      );
      topHeadlinesList = (results['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      topHeadliesLoading = false;
    } catch (e) {
      topHeadliesLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void getEverything() async {
    try {
      everythingLoading;
      Map<String, dynamic> results = await apiServices.get(
        endPoints: ApiConfig.everything,
        parames: {'q': 'news'},
      );

      everythingList = (results['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      everythingLoading = false;
    } catch (e) {
      everythingLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
