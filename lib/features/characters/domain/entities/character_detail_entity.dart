import 'package:equatable/equatable.dart';

class CharacterDetailEntity extends Equatable {
  const CharacterDetailEntity({
    required this.characterName,
    required this.element,
    required this.rarity,
    required this.weapon,
    required this.constellation,
    required this.region,
    required this.affiliation,
    required this.imgNamecard,
    required this.charImage,
    required this.material,
    required this.bestWeapon,
    required this.bestArtefact,
    required this.bestTeam,
    required this.statPriority,
    required this.skills,
  });
  final String characterName;
  final String element;
  final String rarity;
  final String weapon;
  final String constellation;
  final String region;
  final String affiliation;
  final List<ImgNamecard> imgNamecard;
  final List<CharImage> charImage;
  final List<Material> material;
  final List<Best> bestWeapon;
  final List<BestArtefact> bestArtefact;
  final List<BestTeam> bestTeam;
  final List<String> statPriority;
  final List<Skill> skills;

  @override
  List<Object?> get props => [
        characterName,
        element,
        rarity,
        weapon,
        constellation,
        region,
        affiliation,
        imgNamecard,
        charImage,
        material,
        bestWeapon,
        bestArtefact,
        bestTeam,
        statPriority,
        skills,
      ];
}

class Best extends Equatable {
  const Best({
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;

  @override
  List<Object?> get props => [imageUrl, name];
}

class BestArtefact extends Equatable {
  const BestArtefact({
    required this.artifacts,
  });
  final List<Artifact> artifacts;

  @override
  List<Object?> get props => [artifacts];
}

class Artifact extends Equatable {
  const Artifact({
    required this.imageUrl,
    required this.name,
    required this.amount,
  });
  final String imageUrl;
  final String name;
  final String amount;

  @override
  List<Object?> get props => [imageUrl, name, amount];
}

class BestTeam extends Equatable {
  const BestTeam({
    required this.teamName,
    required this.characters,
  });
  final String teamName;
  final List<Character> characters;

  @override
  List<Object?> get props => [teamName, characters];
}

class Character extends Equatable {
  const Character({
    required this.name,
    required this.element,
  });
  final String name;
  final String element;

  @override
  List<Object?> get props => [name, element];
}

class CharImage extends Equatable {
  const CharImage({
    required this.imgCard,
    required this.imgWish,
    required this.imgInGame,
    required this.imgCharNbg,
  });
  final String imgCard;
  final String imgWish;
  final String imgInGame;
  final String imgCharNbg;

  @override
  List<Object?> get props => [imgCard, imgWish, imgInGame, imgCharNbg];
}

class ImgNamecard extends Equatable {
  const ImgNamecard({
    required this.imgNamecard_1,
    required this.imgNamecard_2,
    required this.imgNamecard_3,
  });
  final String imgNamecard_1;
  final String imgNamecard_2;
  final String imgNamecard_3;

  @override
  List<Object?> get props => [imgNamecard_1, imgNamecard_2, imgNamecard_3];
}

class Material extends Equatable {
  const Material({
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  @override
  List<Object?> get props => [name, image];
}

class Skill extends Equatable {
  const Skill({
    required this.type,
    required this.imageUrl,
    required this.name,
    required this.description,
  });
  final String type;
  final String imageUrl;
  final String name;
  final String description;

  @override
  List<Object?> get props => [type, imageUrl, name, description];
}
