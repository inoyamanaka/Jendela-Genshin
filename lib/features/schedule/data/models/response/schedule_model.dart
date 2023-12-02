import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required List<CharacterScheduleModel> super.characterSchedule,
    required List<WeaponScheduleModel> super.weaponSchedule,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharacterScheduleModel extends CharacterSchedule {
  const CharacterScheduleModel({
    required MaterialModel super.material,
    required super.days,
    required List<List<CharacterListModel>> super.characterList,
  });

  factory CharacterScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterScheduleModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class CharacterListModel extends CharacterList {
  const CharacterListModel({
    required super.charImg,
    required super.charElemental,
  });

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterListModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class MaterialModel extends Material {
  const MaterialModel({required super.name, required super.materialImg});
  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}

@JsonSerializable(
  createToJson: false,
  createFactory: true,
  fieldRename: FieldRename.snake,
)
class WeaponScheduleModel extends WeaponSchedule {
  const WeaponScheduleModel({
    required MaterialModel super.material,
    required super.days,
  });

  factory WeaponScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$WeaponScheduleModelFromJson(json);
}
