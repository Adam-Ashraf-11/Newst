import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newst_app/core/data_source/services/api_services.dart';
import 'package:newst_app/features/home/data/models/news_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NewsModel> topHeadlinesList = [];
  List<NewsModel> everythingList = [];
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    getTopHeadlines();
    getEverything();
    super.initState();
  }

  void getTopHeadlines() async {
    Map<String, dynamic> results = await apiServices.get(
      'top-headlines?apiKey=bb6fb5753d274b0e8af54b20bc74dae9&country=us',
    );
    setState(() {
      topHeadlinesList = (results['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    });
  }

  void getEverything() async {
   Map<String, dynamic> results = await apiServices.get(
      'everything?apiKey=bb6fb5753d274b0e8af54b20bc74dae9&q=news',
    );
    setState(() {
      everythingList = (results['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
