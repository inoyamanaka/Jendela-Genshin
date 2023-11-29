import 'package:equatable/equatable.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';

sealed class CharacterDetailEvent extends Equatable {
  const CharacterDetailEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterDetailEvent extends CharacterDetailEvent {
  const GetCharacterDetailEvent({required this.body});

  final CharacterDetailBody body;
}
