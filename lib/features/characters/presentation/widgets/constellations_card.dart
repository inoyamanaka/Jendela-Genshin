import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';

class ConstellationCard extends StatelessWidget {
  const ConstellationCard({
    required this.skillIndex,
    required this.data,
    super.key,
  });

  final ValueNotifier<int> skillIndex;
  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: SizedBox(
            height: 400,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: InkWell(
                            onTap: () {
                              skillIndex.value = index + 5;
                            },
                            child: CachedNetworkImage(
                              imageUrl: data.skills[index + 5].imageUrl,
                            ),
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: data.charImage[0].imgInGame,
                    height: 400,
                    width: 300,
                  ),
                ),
                Expanded(
                  // color: Colors.amber,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: InkWell(
                            onTap: () {
                              skillIndex.value = index + 5 + 3;
                            },
                            child: CachedNetworkImage(
                              imageUrl: data.skills[index + 5 + 3].imageUrl,
                            ),
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
        Text(
          'Descriptions',
          style: GenshinFonts.subTitleInter
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Gap(15),
        ValueListenableBuilder(
          valueListenable: skillIndex,
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.skills[value].name,
                maxLines: 15,
                overflow: TextOverflow.clip,
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              const Gap(10),
              Text(
                data.skills[value].description,
                maxLines: 15,
                overflow: TextOverflow.clip,
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
