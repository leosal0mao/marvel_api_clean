import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:marvel_api/app/modules/characters/domain/dtos/characters_dto.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/characters/domain/usecases/interfaces/usecases.dart';

part 'character_bloc_event.dart';
part 'character_bloc_state.dart';

class CharacterBlocBloc extends Bloc<CharacterBlocEvent, CharacterBlocState> {
  final FetchCharactersUsecase usecase;

  CharacterBlocBloc({
    required this.usecase,
  }) : super(CharacterBlocInitial()) {
    on<FetchCharacterListEvent>((event, emit) async {
      emit(CharacterBlocStateLoading());
      var response = await usecase(params: event.params);
      response.fold(
        (left) => emit(CharacterBlocStateFailure(left.message)),
        (right) => emit(
            CharacterBlocStateSucess(characters: right as List<Characters>)),
      );
    });

    on<PaginateCharactersEvent>((event, emit) async {
      emit((state as CharacterBlocStateSucess).copyWith(isLoading: true));
      var response = await usecase(params: event.params);
      response.fold(
        (left) => null,
        (right) {
          return CharacterBlocStateSucess(
              characters: (state as CharacterBlocStateSucess).characters
                ..addAll(right as Iterable<Characters>));
        },
      );
    });
  }
}
