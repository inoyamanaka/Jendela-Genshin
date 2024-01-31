import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/presentation/widgets/best_artifact.dart';
import 'package:genshin_app/features/characters/presentation/widgets/best_team.dart';
import 'package:genshin_app/features/characters/presentation/widgets/best_weapon.dart';
import 'package:genshin_app/features/characters/presentation/widgets/constellations_card.dart';
import 'package:genshin_app/features/characters/presentation/widgets/title_desc.dart';
import 'package:timelines/timelines.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({
    required this.data,
    super.key,
  });

  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    final carouselIndicator = ValueNotifier<int>(0);
    final skillIndex = ValueNotifier<int>(0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.characterName,
                style: GenshinFonts.subTitleInria,
              ),
              Text(
                data.element,
                style: GenshinFonts.subTitleInria.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://i.pinimg.com/originals/e8/91/66/e891669c27c833ff0f2db2c083344117.png',
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Biography',
                style: GenshinFonts.subTitleInter,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  TitleDescription(
                    title: 'Region',
                    description: data.region,
                  ),
                  const SizedBox(width: 20),
                  TitleDescription(
                    title: 'Weapon',
                    description: data.weapon,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  TitleDescription(
                    title: 'Affiliation',
                    description: data.affiliation,
                  ),
                  const SizedBox(width: 20),
                  TitleDescription(
                    title: 'Constellation',
                    description: data.constellation,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(width: 20),
                  TitleDescription(
                    title: 'Rilis Version',
                    description: '1.3',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Upgrade Materials',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Timeline.tileBuilder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                theme: TimelineTheme.of(context).copyWith(
                  nodePosition: 0,
                  connectorTheme:
                      TimelineTheme.of(context).connectorTheme.copyWith(
                            thickness: 1,
                          ),
                  indicatorTheme: const IndicatorThemeData(
                    position: 0,
                    size: 20,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  indicatorBuilder: (_, index) => Indicator.outlined(),
                  connectorBuilder: (_, index, connectorType) {
                    return SolidLineConnector(
                      indent: connectorType == ConnectorType.start ? 0 : 2.0,
                      endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
                    );
                  },
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 24, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.material[index].name,
                          style: GenshinFonts.subTitleInter,
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: data.material[index].image,
                              height: 40,
                              width: 40,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: const Text('Total Need : 50'),
                                ),
                                const Gap(5),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: const Text('Total Need : 50'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemCount: data.material.length,
                ),
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: data.material.length,
              //   itemBuilder: (context, index) => Column(
              //     children: [
              //       Row(
              //         children: [
              //           CachedNetworkImage(
              //             imageUrl: data.material[index].image,
              //             height: 40,
              //             width: 40,
              //           ),
              //           const Gap(10),
              //           Text(
              //             data.material[index].name,
              //             style: GenshinFonts.subTitleInter,
              //           ),
              //         ],
              //       ),
              //       const Gap(10),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              Text(
                'Best Team',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              BestTeamWidget(carouselIndicator: carouselIndicator, data: data),
              Text(
                'Best Weapons',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              BestWeaponWidget(data: data),
              const SizedBox(height: 20),
              Text(
                'Best Artifact',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              BestArtifactWidget(data: data),
              const SizedBox(height: 20),
              Text(
                'Stat Priority',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.statPriority.length,
                itemBuilder: (context, index) => Text(
                  data.statPriority[index],
                  style: GenshinFonts.subTitleInter,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Skills',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(data.skills[index].imageUrl),
                        ),
                        const Gap(10),
                        TitleDescription(
                          title: data.skills[index].name,
                          description: data.skills[index].description,
                        ),
                      ],
                    ),
                    const Gap(20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Constellations',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ConstellationCard(skillIndex: skillIndex, data: data),
            ],
          ),
        ),
      ],
    );
  }
}
