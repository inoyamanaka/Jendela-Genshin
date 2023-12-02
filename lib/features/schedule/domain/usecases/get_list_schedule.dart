import 'package:dartz/dartz.dart';
import 'package:genshin_app/core/error/failures.dart';
import 'package:genshin_app/core/utils/usecase.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';
import 'package:genshin_app/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleUsecase extends UseCase<ScheduleEntity, NoParams> {
  ScheduleUsecase(this.repository);

  final ScheduleRepository repository;
  @override
  Future<Either<Failure, ScheduleEntity>> call(NoParams params) {
    return repository.getListSchedule();
  }
}
