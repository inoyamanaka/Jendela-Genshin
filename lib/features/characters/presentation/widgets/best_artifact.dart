import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';

class BestArtifactWidget extends StatelessWidget {
  const BestArtifactWidget({
    required this.data,
    super.key,
  });

  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    itemCount: data.bestArtefact[index].artifacts.length,
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
                                    data.bestArtefact[index].artifacts[0]
                                        .amount,
                                    style: GenshinFonts.subTitleInter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    data.bestArtefact[index]
                                        .artifacts[indexAmout].name,
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                    style: GenshinFonts.subTitleInter.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
