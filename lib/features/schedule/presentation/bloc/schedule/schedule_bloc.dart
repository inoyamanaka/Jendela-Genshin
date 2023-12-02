import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshin_app/core/utils/usecase.dart';
import 'package:genshin_app/features/schedule/domain/entities/schedule_entity.dart';
import 'package:genshin_app/features/schedule/domain/usecases/get_list_schedule.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(this.usecase) : super(ScheduleInitial()) {
    on<GetScheduleEvent>((event, emit) async {
      emit(ScheduleLoading());

      try {
        final result = await usecase.call(NoParams());
        result.fold((l) {
          emit(ScheduleFailure(l.message));
        }, (r) {
          emit(ScheduleSuccess(r));
        });
      } catch (e) {
        emit(const ScheduleFailure('Ada error'));
      }
    });
  }

  final ScheduleUsecase usecase;
}
