import 'package:flutter/material.dart';
import 'package:newst_app/core/data_source/services/api_config.dart';
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
  bool isLoading = true;
  String? errorMessage;
  @override
  void initState() {
    getTopHeadlines();
    getEverything();
    super.initState();
  }

  void getTopHeadlines() async {
    try {
      isLoading ;
      Map<String, dynamic> results = await apiServices.get(
        endPoints: ApiConfig.topHeadlines,
        parames: {'country': 'us'},
      );
      setState(() {
        topHeadlinesList = (results['articles'] as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  void getEverything() async {
    try {
      isLoading ;
      Map<String, dynamic> results = await apiServices.get(
        endPoints: ApiConfig.everything,
        parames: {'q': 'news'},
      );
      setState(() {
        everythingList = (results['articles'] as List)
            .map((e) => NewsModel.fromJson(e))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (errorMessage?.isNotEmpty ?? false)
          ? Center(child: Text(errorMessage!))
          : isLoading
          ? CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: topHeadlinesList.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          style: TextStyle(color: Colors.black),
                          topHeadlinesList[index].title,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
