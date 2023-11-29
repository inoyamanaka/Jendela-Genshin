import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/presentation/widgets/title_desc.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({
    required this.data,
    super.key,
  });

  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Row(
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
        const Gap(10),
        SizedBox(
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Row(
              children: [
                Image.network(
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
        const Gap(12),
        Column(
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
            LimitedBox(
              maxHeight: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => const Column(),
              ),
            ),
            Text(data.bestTeam[0].teamName),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Row(
                        children: [
                          const Gap(10),
                          Container(
                            color: Colors.red,
                            height: 80,
                            width: 80,
                            child: Image.network(
                              data.bestTeam[0].characters[index].name,
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
            const SizedBox(height: 20),
            Text(
              'Skills',
              style: GenshinFonts.subTitleInter,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data.skills[0].imageUrl),
                ),
                const Gap(10),
                TitleDescription(
                  title: data.skills[0].name,
                  description: data.skills[0].description,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data.skills[1].imageUrl),
                ),
                const Gap(10),
                TitleDescription(
                  title: data.skills[1].name,
                  description: data.skills[1].description,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data.skills[2].imageUrl),
                ),
                const Gap(10),
                TitleDescription(
                  title: data.skills[2].name,
                  description: data.skills[2].description,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                CircleAvatar(),
                Gap(10),
                TitleDescription(
                  title: 'Passive',
                  description:
                      '''Normal Attack Perform up to 5 rapid strikes. Charged Attack Consumes a certain amount of Stamina to unleash 2 rapid sword strikes. Plunging Attack Plunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.''',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
