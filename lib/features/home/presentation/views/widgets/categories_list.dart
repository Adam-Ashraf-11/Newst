import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/constant/app_colors.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final List<String> categories = const [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16, right: 15),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return IntrinsicWidth(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Text(
                    style: TextStyle(
                      color: currentIndex == index ? AppColors.primaryColor : Colors.black,
                      fontSize: 15,
                    ),
                    categories[index][0].toUpperCase() + categories[index].substring(1),
                  ),
                ),
                Gap(5),
                Container(
                  height: 4,
                  decoration: BoxDecoration(color: currentIndex == index ? AppColors.primaryColor : null),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Gap(10);
        },
      ),
    );
  }
}
