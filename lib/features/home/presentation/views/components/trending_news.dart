import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/enums/request_status_enum.dart';
import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:newst_app/features/home/presentation/views/widgets/all_view_widget.dart';
import 'package:newst_app/features/home/presentation/views/widgets/trending_view_card.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          Image.asset('assets/images/bg_image.png', fit: BoxFit.cover),
          Positioned.fill(
            top: 60,
            child: Column(
              children: [
                Text(textAlign: TextAlign.center, 'Newst', style: Theme.of(context).textTheme.bodyLarge),
                AllViewWidget(description: 'Trending News',),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left:4),
                  child: SizedBox(
                    height: 140,
                    child: Consumer<HomeController>(
                      builder: (BuildContext context,HomeController value, Widget? child) {
                        return switch (value.everythingStatus) {
                          RequestStatusEnum.loading => Center(child: CircularProgressIndicator(color: Colors.white)),
                          RequestStatusEnum.error => Center(child: Text(value.errorMessage!)),
                          RequestStatusEnum.loded => ListView.builder(
                            padding: const EdgeInsets.only(left: 6),
                            scrollDirection: Axis.horizontal,
                            itemCount: value.filteredList.length,
                            itemBuilder: ((context, index) {
                              return TrendingViewCard(index: index);
                            }),
                          ),
                        };
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
