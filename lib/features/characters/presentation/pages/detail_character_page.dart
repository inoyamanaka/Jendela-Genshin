import 'package:flutter/material.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/features/characters/presentation/widgets/information_content.dart';

class DetailCharacterPage extends StatelessWidget {
  const DetailCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: SizedBox(
            // height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Image.network(
                        'https://genshin.jmp.blue/characters/albedo/gacha-splash',
                        fit: BoxFit.contain,
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height,
                          decoration: const BoxDecoration(
                            color: GenshinColors.blackPrimary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              // top: 10,
                            ),
                            child: SingleChildScrollView(
                              child: InformationContent(),
                            ),
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
    );
  }
}
