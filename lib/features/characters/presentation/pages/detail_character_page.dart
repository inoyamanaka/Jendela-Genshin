import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genshin_app/core/shared/constants/colors.dart';
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
    return BlocProvider(
      create: (context) => characterDetailBloc,
      child: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        builder: (context, state) {
          if (state is CharacterDetailLoading) {
            const CircularProgressIndicator();
          }
          if (state is CharacterDetailSuccess) {
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
                              SizedBox(
                                width: double.infinity,
                                height: 250,
                                child: Image.network(
                                  state.data.charImage[0].imgWish,
                                  fit: BoxFit.cover,
                                ),
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
                                  child: SingleChildScrollView(
                                    child: InformationContent(
                                      data: state.data,
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
          return const SizedBox();
        },
      ),
    );
  }
}
