import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';

class BestWeaponWidget extends StatelessWidget {
  const BestWeaponWidget({
    required this.data,
    super.key,
  });

  final CharacterDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
