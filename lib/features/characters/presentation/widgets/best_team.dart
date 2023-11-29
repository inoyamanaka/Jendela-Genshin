import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';

class BestTeamWidget extends StatelessWidget {
  const BestTeamWidget({
    required this.carouselIndicator,
    required this.data,
    super.key,
  });

  final ValueNotifier<int> carouselIndicator;
  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: carouselIndicator,
      builder: (context, value, child) => Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 120,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                carouselIndicator.value = index;
              },
            ),
            itemCount: data.bestTeam.length,
            itemBuilder: (context, indexCarousel, realIndex) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.bestTeam[indexCarousel].teamName,
                  style: GenshinFonts.subTitleInter.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Gap(20),
                              Container(
                                color: Colors.transparent,
                                height: 60,
                                width: 60,
                                child: Image.network(
                                  data.bestTeam[indexCarousel].characters[index]
                                      .name,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DotsIndicator(
            dotsCount: data.bestTeam.length,
            position: carouselIndicator.value,
          ),
        ],
      ),
    );
  }
}
