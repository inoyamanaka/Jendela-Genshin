import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.data,
  });
  final List<List<DataCharacterEntity>> data;

  @override
  List<Object?> get props => [data];
}

class DataCharacterEntity extends Equatable {
  const DataCharacterEntity({
    required this.name,
    required this.element,
    required this.imgNamecard,
    required this.imgInGame,
  });
  final String name;
  final String element;
  final String imgNamecard;
  final String imgInGame;

  @override
  List<Object?> get props => [name, element, imgNamecard, imgInGame];
}
