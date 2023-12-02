import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:genshin_app/constant/api_path.dart';
import 'package:genshin_app/features/schedule/data/models/response/schedule_model.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';

abstract class ScheduleRemoteDatasource {
  Future<ScheduleEntity> getListSchedule();
}

class ScheduleRemoteDatasourceImpl implements ScheduleRemoteDatasource {
  ScheduleRemoteDatasourceImpl(this._client);

  final Dio _client;
  @override
  Future<ScheduleEntity> getListSchedule() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        ApiPath.getListSchedule,
      );
      log(response.data!.toString());
      return ScheduleModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
