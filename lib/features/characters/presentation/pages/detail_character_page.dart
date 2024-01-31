import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
import 'package:genshin_app/core/shared/constants/fonts.dart';
import 'package:genshin_app/di/injection.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_bloc.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_event.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_state.dart';
import 'package:genshin_app/features/characters/presentation/widgets/information_content.dart';

class DetailCharacterPage extends StatefulWidget {
  const DetailCharacterPage({required this.name, super.key});
  final String name;

  @override
  State<DetailCharacterPage> createState() => _DetailCharacterPageState();
}

class _DetailCharacterPageState extends State<DetailCharacterPage> {
  final characterDetailBloc = sl<CharacterDetailBloc>();
  ValueNotifier<bool> isScroll = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    characterDetailBloc.add(
      GetCharacterDetailEvent(
        body: CharacterDetailBody(name: widget.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    void scrollDown() {
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }

    return BlocProvider(
      create: (context) => characterDetailBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: scrollDown,
          child: const Icon(Icons.arrow_upward),
        ),
        body: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
          builder: (context, state) {
            if (state is CharacterDetailLoading) {
              return Scaffold(
                backgroundColor: GenshinColors.blackPrimary,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: Colors.white,
                      ),
                      const Gap(10),
                      Text(
                        'Loading....',
                        style: GenshinFonts.subTitleInter,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is CharacterDetailSuccess) {
              return Scaffold(
                body: NestedScrollView(
                  controller: controller,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverLayoutBuilder(
                      builder: (context, constraints) {
                        return SliverAppBar(
                          backgroundColor: Colors.white,
                          expandedHeight: 250,
                          flexibleSpace: FlexibleSpaceBar(
                            background: SizedBox(
                              width: double.infinity,
                              height: 250,
                              child: CachedNetworkImage(
                                imageUrl: state.data.charImage[0].imgWish,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  body: SizedBox(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 4.3,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height,
                                    decoration: const BoxDecoration(
                                      color: GenshinColors.blackPrimary,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      // controller: controller,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: InformationContent(
                                        data: state.data,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
