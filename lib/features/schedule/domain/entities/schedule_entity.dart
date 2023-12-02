import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  const ScheduleEntity({
    required this.characterSchedule,
    required this.weaponSchedule,
  });
  final List<CharacterSchedule> characterSchedule;
  final List<WeaponSchedule> weaponSchedule;

  @override
  List<Object?> get props => [characterSchedule, weaponSchedule];
}

class CharacterSchedule extends Equatable {
  const CharacterSchedule({
    required this.material,
    required this.days,
    required this.characterList,
  });
  final Material material;
  final String days;
  final List<List<CharacterList>> characterList;

  @override
  List<Object?> get props => [material, days, characterList];
}

class CharacterList extends Equatable {
  const CharacterList({
    required this.charImg,
    required this.charElemental,
  });
  final String charImg;
  final String charElemental;

  @override
  List<Object?> get props => [charImg, charElemental];
}

class Material extends Equatable {
  const Material({
    required this.name,
    required this.materialImg,
  });
  final String name;
  final String materialImg;

  @override
  List<Object?> get props => [name, materialImg];
}

class WeaponSchedule extends Equatable {
  const WeaponSchedule({
    required this.material,
    required this.days,
  });
  final Material material;
  final String days;

  @override
  List<Object?> get props => [material, days];
}
