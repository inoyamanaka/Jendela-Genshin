import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, ScheduleEntity>> getListSchedule();
}
