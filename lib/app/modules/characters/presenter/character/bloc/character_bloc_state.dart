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

class CharacterBlocStateSucess extends CharacterBlocState {
  final List<Characters> characters;
  final bool? isLoading;

  CharacterBlocStateSucess({
    required this.characters,
    this.isLoading = false,
  });

  CharacterBlocStateSucess copyWith({
    List<Characters>? characters,
    bool? isLoading,
  }) {
    return CharacterBlocStateSucess(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [characters, isLoading];
}
