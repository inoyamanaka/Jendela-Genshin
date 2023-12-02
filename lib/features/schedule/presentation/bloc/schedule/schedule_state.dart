part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleFailure extends ScheduleState {
  const ScheduleFailure(this.message);

  final String message;
}

class ScheduleSuccess extends ScheduleState {
  const ScheduleSuccess(this.data);

  final ScheduleEntity data;
}
