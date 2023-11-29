import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterEntity>> getListCharacter();
  Future<Either<Failure, CharacterDetailEntity>> getDetailCharacter(
    CharacterDetailBody body,
  );
}
