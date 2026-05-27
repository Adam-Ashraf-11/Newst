import 'package:flutter/material.dart';
import 'package:newst_app/features/bookmark/bookmark_view.dart';
import 'package:newst_app/features/home/presentation/views/home_view.dart';
import 'package:newst_app/features/profile/presentation/views/profile_view.dart';
import 'package:newst_app/features/search/search_view.dart';

class MainViewes extends StatefulWidget {
  const MainViewes({super.key});

  @override
  State<MainViewes> createState() => _MainViewesState();
}

class _MainViewesState extends State<MainViewes> {
  int currentIndex = 0;
  List<Widget> views = [
    HomeView(),
    BookmarkView(),
    SearchView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
         setState(() {
            currentIndex = index;
         });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'profile',
          ),
        ],
      ),
      body: views[currentIndex] ,
    );
  }
}
