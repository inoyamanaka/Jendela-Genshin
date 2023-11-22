part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterFailure extends CharacterState {
  const CharacterFailure(this.message);

  final String message;
}

final class CharacterSuccess extends CharacterState {
  const CharacterSuccess(this.data);

  final CharacterEntity data;
}
