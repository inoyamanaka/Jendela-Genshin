import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterEntity>> getListCharacter();
}
