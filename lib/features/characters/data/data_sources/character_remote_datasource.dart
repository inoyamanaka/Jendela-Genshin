import 'package:dio/dio.dart';
import 'package:genshin_app/constant/api_path.dart';
import 'package:genshin_app/features/characters/data/models/request/get_detail_character_body.dart';
import 'package:genshin_app/features/characters/data/models/response/get_character_list.dart';
import 'package:genshin_app/features/characters/data/models/response/get_detail_character.dart';
import 'package:genshin_app/features/characters/domain/entities/character_detail_entity.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';

abstract class CharacterRemoteDatasource {
  Future<CharacterEntity> getListCharacter();
  Future<CharacterDetailEntity> getDetailCharacter(CharacterDetailBody body);
}

class CharacterRemoteDatasourceImpl implements CharacterRemoteDatasource {
  CharacterRemoteDatasourceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterEntity> getListCharacter() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.getListCharacter,
      );

      return CharacterListModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<CharacterDetailEntity> getDetailCharacter(
    CharacterDetailBody body,
  ) async {
    print(body);
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '${ApiPath.getListCharacter}/${body.name}',
      );

      print(response);

      return CharacterDetailModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
