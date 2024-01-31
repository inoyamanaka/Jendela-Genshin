// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListModel _$CharacterListModelFromJson(Map<String, dynamic> json) =>
    CharacterListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) =>
                  DataCharacterListModel.fromJson(e as Map<String, dynamic>),)
              .toList(),)
          .toList(),
    );

DataCharacterListModel _$DataCharacterListModelFromJson(
        Map<String, dynamic> json,) =>
    DataCharacterListModel(
      name: json['name'] as String,
      element: json['element'] as String,
      imgNamecard: json['img_namecard'] as String,
      imgInGame: json['img_in_game'] as String,
    );
