import 'package:flutter/material.dart';

import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (BuildContext context) => HomeController()..init(),
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body: (value.errorMessage?.isNotEmpty ?? false)
                ? Center(child: Text(value.errorMessage!))
                : value.everythingLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.topHeadlinesList.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Text(
                                style: TextStyle(color: Colors.black),
                                value.topHeadlinesList[index].title,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
