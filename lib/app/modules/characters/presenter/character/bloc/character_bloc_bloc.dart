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
      final result = response.fold(
        (left) => (CharacterBlocStateFailure(left.message)),
        (right) => (CharacterBlocStateSucess(responseData: right)),
      );
      emit(result);
    });

    on<PaginateCharactersEvent>((event, emit) async {
      emit((state as CharacterBlocStateSucess).copyWith(isLoading: true));
      var response = await usecase(params: event.params);
      final result = response.fold(
        (left) => (CharacterBlocStateFailure(left.message)),
        (right) => CharacterBlocStateSucess(
          responseData: (state as CharacterBlocStateSucess).responseData
            ..data.characters!.addAll(right.data.characters ?? []),
        ),
      );
      emit(result);
    });
  }
}
