part of 'character_bloc_bloc.dart';

abstract class CharacterBlocEvent extends Equatable {}

class FetchCharacterListEvent extends CharacterBlocEvent {
  final CharactersDto params;

  FetchCharacterListEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class PaginateCharactersEvent extends CharacterBlocEvent {
  final CharactersDto params;

  PaginateCharactersEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
