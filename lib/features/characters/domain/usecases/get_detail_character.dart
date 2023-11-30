import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/core/utils/usecase.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/domain/repositories/characters_repository.dart';

class CharacterDetailUsecase
    extends UseCase<CharacterDetailEntity, CharacterDetailBody> {
  CharacterDetailUsecase(this.repository);

  final CharacterRepository repository;
  @override
  Future<Either<Failure, CharacterDetailEntity>> call(
    CharacterDetailBody params,
  ) {
    return repository.getDetailCharacter(params);
  }
}
