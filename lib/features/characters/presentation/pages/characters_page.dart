import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/di/injection.dart';
import 'package:genshin_app/features/characters/presentation/bloc/character_bloc.dart';
import 'package:genshin_app/features/characters/presentation/widgets/character_card.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final characterBloc = sl<CharacterBloc>();
  ValueNotifier<int> indexTab = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    characterBloc.add(GetCharacterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => characterBloc,
      child: Scaffold(
        backgroundColor: GenshinColors.blackPrimary,
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              const CircularProgressIndicator();
            }
            if (state is CharacterSuccess) {
              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: indexTab,
                    builder: (context, value, child) => Container(
                      height: 200,
                      color: Colors.grey,
                      child: Image.asset(
                        'assets/images/city_${value + 1}.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainedTabBarView(
                      tabBarProperties: const TabBarProperties(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        indicatorColor: Colors.white,
                        indicatorWeight: 5,
                      ),
                      tabs: [
                        FittedBox(
                          child: Text(
                            'Mondstadt',
                            style: GenshinFonts.subTitleInter,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'Liyue',
                            style: GenshinFonts.subTitleInter,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'Inazuma',
                            style: GenshinFonts.subTitleInter,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'Sumeru',
                            style: GenshinFonts.subTitleInter,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'Fontaine',
                            style: GenshinFonts.subTitleInter,
                          ),
                        ),
                      ],
                      views: [
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: state.data.data.length,
                            cacheExtent: 999999,
                            itemBuilder: (BuildContext ctx, index) {
                              return CharacterCard(
                                name: state.data.data[index].name,
                                imgChar: state.data.data[index].imgInGame,
                                background: state.data.data[index].imgNamecard,
                              );
                            },
                          ),
                        ),
                        Container(color: Colors.green),
                        Container(color: Colors.red),
                        Container(color: Colors.blue),
                        Container(color: Colors.yellow),
                      ],
                      onChange: (p0) {
                        indexTab.value = p0;
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
