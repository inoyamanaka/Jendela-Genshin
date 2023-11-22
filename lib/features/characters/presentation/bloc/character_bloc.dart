import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshin_app/core/utils/usecase.dart';
import 'package:genshin_app/features/characters/domain/entities/characters_entity.dart';
import 'package:genshin_app/features/characters/domain/usecases/get_list_character.dart';


part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this.usecase) : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      emit(CharacterLoading());
      try {
        final result = await usecase.call(NoParams());
        result.fold((l) {
          emit(CharacterFailure(l.message));
        }, (r) {
          emit(CharacterSuccess(r));
        });
      } catch (e) {
        emit(const CharacterFailure('Ada error'));
      }
    });
  }
  final CharacterUsecase usecase;
}
