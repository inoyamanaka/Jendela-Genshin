import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/presentation/widgets/title_desc.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ALBEDO',
              style: GenshinFonts.subTitleInria,
            ),
            Text(
              'Geo',
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
            const Row(
              children: [
                SizedBox(width: 20),
                TitleDescription(
                  title: 'Birthday',
                  description: '01/09',
                ),
                SizedBox(width: 20),
                TitleDescription(
                  title: 'Weapon',
                  description: 'Sword',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                SizedBox(width: 20),
                TitleDescription(
                  title: 'Affiliation',
                  description: 'Knight of Favonoius',
                ),
                SizedBox(width: 20),
                TitleDescription(
                  title: 'Constellation',
                  description: 'Princeps Cretaceus',
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
            ElevatedButton(
              onPressed: () {
                showBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              child: const Text('Constellation'),
            ),
            const SizedBox(height: 20),
            Text(
              'Skills',
              style: GenshinFonts.subTitleInter,
            ),
            const Row(
              children: [
                CircleAvatar(),
                Gap(10),
                TitleDescription(
                  title: 'Elemental Burst',
                  description:
                      '''Under Albedo's command, Geo crystals surge and burst forth, dealing AoE Geo DMG in front of him. If a Solar Isotoma created by Albedo himself is on the field, 7 Fatal Blossoms will be generated in the Solar Isotoma field, bursting violently into bloom and dealing AoE Geo DMG Tecotonic Tide DMG and Fatal Blossom DMG will not generate Transient Blossoms ''',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                CircleAvatar(),
                Gap(10),
                TitleDescription(
                  title: 'Elemental Skill',
                  description:
                      '''Albedo creates a Solar Isotoma using alchemy, which deals AoE Geo DMG on appearance. Solar Isotoma When enemies within the Solar Isotoma zone are hit, the Solar Isotoma will generate Transient Blossoms which deal AoE Geo DMG. DMG dealt scales off Albedo's DEF. Transient Blossoms can only be generated once every 2s. When a character is located at the locus of the Solar Isotoma, the Solar Isotoma will accumulate Geo power to form a crystallized platform that lifts the character up to a certain height. Only one crystallized platform can exist at a time. Solar Isotoma is considered a Geo construct. Hold to designate the location of the skill''',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                CircleAvatar(),
                Gap(10),
                TitleDescription(
                  title: 'Normal Attack',
                  description:
                      '''Normal Attack Perform up to 5 rapid strikes. Charged Attack Consumes a certain amount of Stamina to unleash 2 rapid sword strikes. Plunging Attack Plunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.''',
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
