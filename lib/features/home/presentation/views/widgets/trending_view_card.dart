import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:provider/provider.dart';

class TrendingViewCard extends StatelessWidget {
  const TrendingViewCard({super.key, required this.index});

 final int index ;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) =>
       Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Container(
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black
                    .withValues(alpha: 0.2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.network(value.filteredList[index].urlToImage!),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withValues(alpha: 0.1), Colors.black.withValues(alpha: 0.4)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
