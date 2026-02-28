import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/const/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';

class HomeTrendingCard extends StatelessWidget {
  final String title;
  final String location;
  final String image;
  final String price;
  final double rating;
  final int reviewCount;

  const HomeTrendingCard({
    super.key,
    required this.title,
    required this.location,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        clipBehavior: .hardEdge,
        shadowColor: AppPallete.neutral900,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Column(
          children: [
            Stack(
              alignment: .topRight,
              children: [
                Image.asset(
                  ImageConst.kampungWarnaWarni,
                  height: 190,
                  width: .infinity,
                  filterQuality: .medium,
                  fit: .cover,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      backgroundColor: AppPallete.primaryNormal,
                      child: Icon(Icons.bookmark_border_rounded),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: .end,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 4,
                    children: [
                      Text(
                        title,
                        overflow: .ellipsis,
                        style: AppText.semiBold18,
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Text('$rating'),
                          RatingBar.builder(
                            initialRating: rating,
                            itemCount: 5,
                            itemSize: 20,
                            allowHalfRating: true,
                            unratedColor: AppPallete.neutral400,
                            itemBuilder: (context, _) => Icon(
                              Icons.star_rounded,
                              color: AppPallete.yellowNormal,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            '($reviewCount ulasan)',
                            style: AppText.regular12.copyWith(
                              color: AppPallete.neutral600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .start,
                        spacing: 6,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(location),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      Text(
                        'Mulai dari',
                        style: AppText.regular12.copyWith(
                          color: AppPallete.neutral600,
                        ),
                      ),
                      Text(
                        price,
                        style: AppText.semiBold20.copyWith(
                          color: AppPallete.primaryNormal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
