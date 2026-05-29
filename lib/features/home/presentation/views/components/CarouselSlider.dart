        // CarouselSlider.builder(
                              //   itemCount: value.everythingList
                              //       .where(
                              //         (item) =>
                              //             item.urlToImage != null &&
                              //             item.urlToImage!.isNotEmpty &&
                              //             !item.urlToImage!.contains("npr.org"),
                              //       )
                              //       .length,
                              //   itemBuilder: (context, index, realIndex) {
                              //     final filteredList = value.everythingList
                              //         .where(
                              //           (item) =>
                              //               item.urlToImage != null &&
                              //               item.urlToImage!.isNotEmpty &&
                              //               !item.urlToImage!.contains("npr.org"),
                              //         )
                              //         .toList();
                              //     final article = filteredList[index];
                              //     return ClipRRect(
                              //       borderRadius: BorderRadius.circular(16),
                              //       child: Image.network(
                              //         article.urlToImage!,
                              //         fit: BoxFit.cover,
                              //         width: double.infinity,
                              //       ),
                              //     );
                              //   },
                              //   options: CarouselOptions(
                              //     height: 200,
                              //     viewportFraction: 0.8,
                              //     enlargeCenterPage: true,
                              //     autoPlay: true,
                              //   ),
                              // );