import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GenshinFonts.subTitleInter.copyWith(),
          ),
          const Gap(5),
          Text(
            description,
            maxLines: 15,
            overflow: TextOverflow.clip,
            style: GenshinFonts.subTitleInter
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
