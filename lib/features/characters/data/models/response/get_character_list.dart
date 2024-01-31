import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_character_list.g.dart';

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharacterListModel extends CharacterEntity {
  const CharacterListModel({
    required List<List<DataCharacterListModel>> super.data,
  });

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterListModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class DataCharacterListModel extends DataCharacterEntity {
  const DataCharacterListModel({
    required super.name,
    required super.element,
    required super.imgNamecard,
    required super.imgInGame,
  });

  factory DataCharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$DataCharacterListModelFromJson(json);
}
