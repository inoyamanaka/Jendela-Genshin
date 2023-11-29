import 'package:equatable/equatable.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';

sealed class CharacterDetailState extends Equatable {
  const CharacterDetailState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailInitial extends CharacterDetailState {}

final class CharacterDetailLoading extends CharacterDetailState {}

final class CharacterDetailFailure extends CharacterDetailState {
  const CharacterDetailFailure(this.message);

  final String message;
}

final class CharacterDetailSuccess extends CharacterDetailState {
  const CharacterDetailSuccess(this.data);

  final CharacterDetailEntity data;
}
