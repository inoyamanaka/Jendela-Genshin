import 'package:dio/dio.dart';
import 'package:genshin_app/constant/api_path.dart';
import 'package:genshin_app/features/characters/data/models/response/get_character_list.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';

abstract class CharacterRemoteDatasource {
  Future<CharacterEntity> getListCharacter();
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
}
