// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailModel _$CharacterDetailModelFromJson(
        Map<String, dynamic> json,) =>
    CharacterDetailModel(
      characterName: json['character_name'] as String,
      element: json['element'] as String,
      rarity: json['rarity'] as String,
      weapon: json['weapon'] as String,
      constellation: json['constellation'] as String,
      region: json['region'] as String,
      affiliation: json['affiliation'] as String,
      imgNamecard: (json['img_namecard'] as List<dynamic>)
          .map((e) => NamecardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      charImage: (json['char_image'] as List<dynamic>)
          .map((e) => CharImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: (json['material'] as List<dynamic>)
          .map((e) => MaterialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestWeapon: (json['best_weapon'] as List<dynamic>)
          .map((e) => BestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestArtefact: (json['best_artefact'] as List<dynamic>)
          .map((e) => BestArtefactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestTeam: (json['best_team'] as List<dynamic>)
          .map((e) => BestTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statPriority: (json['stat_priority'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

BestModel _$BestModelFromJson(Map<String, dynamic> json) => BestModel(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
    );

BestArtefactModel _$BestArtefactModelFromJson(Map<String, dynamic> json) =>
    BestArtefactModel(
      artifacts: (json['artifacts'] as List<dynamic>)
          .map((e) => ArtifactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ArtifactModel _$ArtifactModelFromJson(Map<String, dynamic> json) =>
    ArtifactModel(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      amount: json['amount'] as String,
    );

BestTeamModel _$BestTeamModelFromJson(Map<String, dynamic> json) =>
    BestTeamModel(
      teamName: json['team_name'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      name: json['name'] as String,
      element: json['element'] as String,
    );

CharImageModel _$CharImageModelFromJson(Map<String, dynamic> json) =>
    CharImageModel(
      imgCard: json['img_card'] as String,
      imgWish: json['img_wish'] as String,
      imgInGame: json['img_in_game'] as String,
      imgCharNbg: json['img_char_nbg'] as String,
    );

NamecardModel _$NamecardModelFromJson(Map<String, dynamic> json) =>
    NamecardModel(
      imgNamecard_1: json['img_namecard_1'] as String,
      imgNamecard_2: json['img_namecard_2'] as String,
      imgNamecard_3: json['img_namecard_3'] as String,
    );

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    MaterialModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      type: json['type'] as String,
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
