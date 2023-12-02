import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/features/schedule/data/data_sources/schedule_remote_datasource.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';
import 'package:genshin_app/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl(this.datasource);

  final ScheduleRemoteDatasource datasource;
  @override
  Future<Either<Failure, ScheduleEntity>> getListSchedule() async {
    try {
      final result = await datasource.getListSchedule();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromJson(e.response!.data as Map<String, dynamic>),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
