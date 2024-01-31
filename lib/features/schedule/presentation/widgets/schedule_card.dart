import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';
import 'package:remixicon/remixicon.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    required this.charSchedule,
    required this.index,
    super.key,
  });

  final List<CharacterSchedule> charSchedule;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Container(
          decoration: const BoxDecoration(
            color: GenshinColors.greyPrimary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: GenshinColors.blackPrimary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: charSchedule[index].material.materialImg,
                      fit: BoxFit.scaleDown,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                charSchedule[index].material.name,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: GenshinFonts.subTitleInria.copyWith(
                                  color: GenshinColors.blackPrimary,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          const Icon(
                            Remix.calendar_event_line,
                            size: 15,
                          ),
                          const Gap(5),
                          Text(charSchedule[index].days),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: charSchedule[index].characterList[0].length,
                  itemBuilder: (context, indexTeam) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: GenshinColors.blackPrimary,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: CachedNetworkImage(
                            height: 45,
                            width: 45,
                            imageUrl: charSchedule[index]
                                .characterList[0][indexTeam]
                                .charImg,
                          ),
                        ),
                        Positioned(
                          left: 5,
                          right: 5,
                          bottom: 10,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: GenshinColors.blackPrimary,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: CachedNetworkImage(
                              height: 15,
                              width: 15,
                              imageUrl: charSchedule[index]
                                  .characterList[0][indexTeam]
                                  .charElemental,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
