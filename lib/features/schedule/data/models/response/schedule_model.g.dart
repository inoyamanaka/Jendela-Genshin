// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      characterSchedule: (json['character_schedule'] as List<dynamic>)
          .map(
            (e) => CharacterScheduleModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      weaponSchedule: (json['weapon_schedule'] as List<dynamic>)
          .map((e) => WeaponScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CharacterScheduleModel _$CharacterScheduleModelFromJson(
  Map<String, dynamic> json,
) =>
    CharacterScheduleModel(
      material:
          MaterialModel.fromJson(json['material'] as Map<String, dynamic>),
      days: json['days'] as String,
      characterList: (json['character_list'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map(
                (e) => CharacterListModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),)
          .toList(),
    );

CharacterListModel _$CharacterListModelFromJson(Map<String, dynamic> json) =>
    CharacterListModel(
      charImg: json['char_img'] as String,
      charElemental: json['char_elemental'] as String,
    );

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    MaterialModel(
      name: json['name'] as String,
      materialImg: json['material_img'] as String,
    );

WeaponScheduleModel _$WeaponScheduleModelFromJson(Map<String, dynamic> json) =>
    WeaponScheduleModel(
      material:
          MaterialModel.fromJson(json['material'] as Map<String, dynamic>),
      days: json['days'] as String,
    );
