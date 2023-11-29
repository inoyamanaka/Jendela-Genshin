import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/features/characters/data/data_sources/character_remote_datasource.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';
import 'package:genshin_app/features/characters/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(this.datasource);

  final CharacterRemoteDatasource datasource;
  @override
  Future<Either<Failure, CharacterEntity>> getListCharacter() async {
    try {
      final result = await datasource.getListCharacter();

      return Right(result);
    } on DioException catch (e) {
      // Handle DioException
      return Left(
        ServerFailure.fromJson(e.response!.data as Map<String, dynamic>),
      );
    } catch (e) {
      // Handle other exceptions
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, CharacterDetailEntity>> getDetailCharacter(CharacterDetailBody body) async {
    try {
      final result = await datasource.getDetailCharacter(body);

      return Right(result);
    } on DioException catch (e) {
      // Handle DioException
      return Left(
        ServerFailure.fromJson(e.response!.data as Map<String, dynamic>),
      );
    } catch (e) {
      // Handle other exceptions
      return Left(ServerFailure(e.toString()));
    }
  }
}
