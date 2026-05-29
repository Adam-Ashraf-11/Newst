import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/enums/request_status_enum.dart';
import 'package:newst_app/features/home/presentation/manager/home_controller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Stack(
        children: [
          Image.asset('assets/images/bg_image.png', fit: BoxFit.cover),
          Positioned.fill(
            top: 60,
            child: Column(
              children: [
                Text(textAlign: TextAlign.center, 'Newst', style: Theme.of(context).textTheme.bodyLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Trending News',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'All View',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: SizedBox(
                    height: 140,
                    child: Consumer<HomeController>(
                      builder: (BuildContext context, HomeController value, Widget? child) {
                        return
                        switch (value.everythingStatus) {
                          RequestStatusEnum.loading => Center(child: CircularProgressIndicator(color: Colors.white)),
                          RequestStatusEnum.error => Center(child: Text(value.errorMessage!)),
                          RequestStatusEnum.loded => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Stack(
                                children: [
                                  if (value.everythingList[index].urlToImage != null &&
                                      value.everythingList[index].urlToImage!.isNotEmpty &&
                                      !value.everythingList[index].urlToImage!.contains("npr.org"))
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(value.everythingList[index].urlToImage!),
                                      ),
                                    ),
                                ],
                              );
                            }),
                            itemCount: value.everythingList.length,
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
