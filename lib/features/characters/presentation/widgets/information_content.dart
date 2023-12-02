import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/presentation/widgets/best_team.dart';
import 'package:genshin_app/features/characters/presentation/widgets/title_desc.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({
    required this.data,
    super.key,
  });

  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    final carouselIndicator = ValueNotifier<int>(0);
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
                  const TitleDescription(
                    title: 'Birthday',
                    description: '01/09',
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
              SizedBox(
                height: 100,
                width: double.infinity,
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: data.bestWeapon.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Row(
                            children: [
                              const Gap(10),
                              Container(
                                color: Colors.transparent,
                                height: 60,
                                width: 60,
                                child: Image.network(
                                  data.bestWeapon[index].imageUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Best Artifact',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 260,
                width: double.infinity,
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Gap(10),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: data.bestArtefact.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => SizedBox(
                            height: 50,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  data.bestArtefact[index].artifacts.length,
                              itemBuilder: (context, indexAmout) => FittedBox(
                                child: Row(
                                  children: [
                                    const Gap(10),
                                    Stack(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          height: 60,
                                          width: 60,
                                          child: CachedNetworkImage(
                                            imageUrl: data.bestArtefact[index]
                                                .artifacts[indexAmout].imageUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1,
                                          right: 10,
                                          child: CircleAvatar(
                                            radius: 8,
                                            backgroundColor: Colors.blue,
                                            child: Text(
                                              data.bestArtefact[index]
                                                  .artifacts[0].amount,
                                              style: GenshinFonts.subTitleInter,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data.bestArtefact[index]
                                          .artifacts[indexAmout].name,
                                      style:
                                          GenshinFonts.subTitleInter.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Stat Priority',
                style: GenshinFonts.subTitleInter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ListView.builder(
                shrinkWrap: true,
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
            ],
          ),
        ),
      ],
    );
  }
}
