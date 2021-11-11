part of 'character_bloc_bloc.dart';

abstract class CharacterBlocState extends Equatable {}

class CharacterBlocInitial extends CharacterBlocState {
  @override
  List<Object?> get props => [];
}

class CharacterBlocStateLoading extends CharacterBlocState {
  @override
  List<Object?> get props => [];
}

class CharacterBlocStateFailure extends CharacterBlocState {
  final String message;

  CharacterBlocStateFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CharacterStateSucess extends CharacterBlocState {
  final List<Characters>? characters;
  final bool? isLoading;

  CharacterStateSucess({
    this.characters,
    this.isLoading = false,
  });

  CharacterStateSucess copyWith({
    List<Characters>? characters,
    bool? isLoading,
  }) {
    return CharacterStateSucess(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [characters, isLoading];
}
