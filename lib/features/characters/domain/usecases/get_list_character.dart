import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/core/utils/usecase.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';
import 'package:genshin_app/features/characters/domain/repositories/characters_repository.dart';


class CharacterUsecase extends UseCase<CharacterEntity, NoParams> {
  CharacterUsecase(this.repository);

  final CharacterRepository repository;
  @override
  Future<Either<Failure, CharacterEntity>> call(NoParams params) {
    return repository.getListCharacter();
  }
}
