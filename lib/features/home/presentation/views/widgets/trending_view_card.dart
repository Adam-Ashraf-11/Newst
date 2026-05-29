import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:provider/provider.dart';

class TrendingViewCard extends StatelessWidget {
  const TrendingViewCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Container(
        width: 240,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Consumer<HomeController>(
            builder: (BuildContext context, HomeController value, Widget? child) {
              final model = value.filteredList[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(model.urlToImage!, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withValues(alpha: 0.1), Colors.black.withValues(alpha: 0.4)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 10, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                                     Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            model.author ?? '',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                        ,
                        Text(
                       value.formatDate(index),   
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ]
                    )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
