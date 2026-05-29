import 'package:flutter/material.dart';
import 'package:newst_app/core/data_source/services/api_config.dart';
import 'package:newst_app/core/data_source/services/api_services.dart';
import 'package:newst_app/core/enums/request_status_enum.dart';
import 'package:newst_app/features/home/data/models/news_model.dart';

class HomeController extends ChangeNotifier {
  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;

  bool topHeadliesLoading = true;
  bool everythingLoading = true;
  String? errorMessage;
  List<NewsModel> topHeadlinesList = [];
  List<NewsModel> everythingList = [];
  ApiServices apiServices = ApiServices();
      List<NewsModel> filteredList = [];

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
      topHeadlinesList = (results['articles'] as List).map((e) => NewsModel.fromJson(e)).toList();
      topHeadliesLoading = false;
    } catch (e) {
      topHeadliesLoading = false;
      errorMessage = e.toString();
    }
    if (hasListeners) {
      notifyListeners();
    }
  }

  void getEverything() async {
    try {
      Map<String, dynamic> results = await apiServices.get(endPoints: ApiConfig.everything, parames: {'q': 'news'});
      everythingList = (results['articles'] as List).map((e) => NewsModel.fromJson(e)).toList();
      filteredList = everythingList
          .where(
            (item) => item.urlToImage != null && item.urlToImage!.isNotEmpty && !item.urlToImage!.contains("npr.org"),
          )
          .toList();
      everythingStatus = RequestStatusEnum.loded;
    } catch (e) {
      errorMessage = e.toString();
      everythingStatus = RequestStatusEnum.error;
    }
    if (hasListeners) {
      notifyListeners();
    }
  }


     String formatDate(int index) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(filteredList[index].publishedAt));
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

}
