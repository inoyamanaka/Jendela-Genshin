import 'package:bloc/bloc.dart';
import 'package:genshin_app/features/characters/domain/usecases/get_detail_character.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_event.dart';
import 'package:genshin_app/features/characters/presentation/character_detail_bloc/character_detail_state.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  CharacterDetailBloc(this.usecase) : super(CharacterDetailInitial()) {
    on<GetCharacterDetailEvent>((event, emit) async {
      emit(CharacterDetailLoading());
      try {
        final result = await usecase.call(event.body);
        print(result);
        result.fold((l) {
          emit(CharacterDetailFailure(l.message));
        }, (r) {
          emit(CharacterDetailSuccess(r));
        });
      } catch (e) {
        emit(const CharacterDetailFailure('Ada error'));
      }
    });
  }
  final CharacterDetailUsecase usecase;
}
