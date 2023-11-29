// ignore_for_file: type_init_formals

import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_detail_character.g.dart';

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharacterDetailModel extends CharacterDetailEntity {
  const CharacterDetailModel({
    required super.characterName,
    required super.element,
    required super.rarity,
    required super.weapon,
    required super.constellation,
    required super.region,
    required super.affiliation,
    required List<NamecardModel> super.imgNamecard,
    required List<CharImageModel> super.charImage,
    required List<MaterialModel> super.material,
    required List<BestModel> super.bestWeapon,
    required List<BestModel> super.bestArtefact,
    required List<BestTeamModel> super.bestTeam,
    required List<String> super.statPriority,
    required List<SkillModel> super.skills,
  });

  factory CharacterDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class BestModel extends Best {
  const BestModel({required super.imageUrl, required super.name});
  factory BestModel.fromJson(Map<String, dynamic> json) =>
      _$BestModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class BestTeamModel extends BestTeam {
  const BestTeamModel({
    required super.teamName,
    required List<CharacterModel> super.characters,
  });

  factory BestTeamModel.fromJson(Map<String, dynamic> json) =>
      _$BestTeamModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharacterModel extends Character {
  const CharacterModel({required super.name, required super.element});

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharImageModel extends CharImage {
  const CharImageModel({
    required super.imgCard,
    required super.imgWish,
    required super.imgInGame,
    required super.imgCharNbg,
  });

  factory CharImageModel.fromJson(Map<String, dynamic> json) =>
      _$CharImageModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class NamecardModel extends ImgNamecard {
  const NamecardModel({
    required super.imgNamecard_1,
    required super.imgNamecard_2,
    required super.imgNamecard_3,
  });

  factory NamecardModel.fromJson(Map<String, dynamic> json) =>
      _$NamecardModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class MaterialModel extends Material {
  const MaterialModel({required super.name, required super.image});

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class SkillModel extends Skill {
  const SkillModel({
    required super.type,
    required super.imageUrl,
    required super.name,
    required super.description,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
}
