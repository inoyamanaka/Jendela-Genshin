import 'package:dio/dio.dart';
import 'package:genshin_app/core/env/env_config.dart';
import 'package:genshin_app/core/network/dio_handler.dart';
import 'package:genshin_app/features/characters/data/data_sources/character_remote_datasource.dart';
import 'package:genshin_app/features/characters/data/repositories/character_repository_impl.dart';
import 'package:genshin_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:genshin_app/features/characters/domain/usecases/get_detail_character.dart';
import 'package:genshin_app/features/characters/domain/usecases/get_list_character.dart';
import 'package:genshin_app/features/characters/presentation/bloc/character_bloc.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_bloc.dart';
import 'package:genshin_app/features/schedule/data/data_sources/schedule_remote_datasource.dart';
import 'package:genshin_app/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:genshin_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:genshin_app/features/schedule/domain/usecases/get_list_schedule.dart';
import 'package:genshin_app/features/schedule/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> init() async {
    final config = EnvConfig.getInstance();
    sl
      ..registerLazySingleton(() => config)
      ..registerLazySingleton<Dio>(() => sl<DioHandler>().dio)
      ..registerLazySingleton(
        () => DioHandler(
          config: sl<EnvConfig>(),
        ),
      )

      // CHARACTER
      ..registerLazySingleton<CharacterRemoteDatasource>(
        () => CharacterRemoteDatasourceImpl(sl()),
      )
      ..registerLazySingleton<CharacterRepository>(
        () => CharacterRepositoryImpl(sl()),
      )
      ..registerLazySingleton(
        () => CharacterUsecase(sl()),
      )
      ..registerLazySingleton(
        () => CharacterDetailUsecase(sl()),
      )

      // SCHEDULE
      ..registerLazySingleton<ScheduleRemoteDatasource>(
        () => ScheduleRemoteDatasourceImpl(sl()),
      )
      ..registerLazySingleton<ScheduleRepository>(
        () => ScheduleRepositoryImpl(sl()),
      )
      ..registerLazySingleton(
        () => ScheduleUsecase(sl()),
      )

      // BLOC
      ..registerFactory(() => CharacterBloc(sl()))
      ..registerFactory(() => CharacterDetailBloc(sl()))
      ..registerFactory(() => ScheduleBloc(sl()));
  }
}
