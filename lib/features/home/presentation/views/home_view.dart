import 'package:flutter/material.dart';
import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:newst_app/features/home/presentation/views/components/trending_news.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routName = 'home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (BuildContext context) => HomeController()..init(),
      child: Consumer<HomeController>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            body:  Column(children: [TrendingNews()]),
          );
        },
      ),
    );
  }
}
