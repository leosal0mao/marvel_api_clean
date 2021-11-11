import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_api/app/modules/characters/domain/dtos/characters_dto.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';

part 'character_bloc_event.dart';
part 'character_bloc_state.dart';

class CharacterBlocBloc extends Bloc<CharacterBlocEvent, CharacterBlocState> {
  CharacterBlocBloc() : super(CharacterBlocInitial());
  // {
  //   on<CharacterBlocEvent>((event, emit) {});
  // }
  @override
  Stream<CharacterBlocState> mapEventToState(CharacterBlocEvent event) async* {
    if (event is FetchCharacterListEvent) {
      yield* mapCharacterLoadingEvent(event);
    }
  }

  Stream<CharacterBlocState> mapCharacterLoadingEvent(
      FetchCharacterListEvent event) async* {
    yield CharacterBlocStateLoading();
  }
}
