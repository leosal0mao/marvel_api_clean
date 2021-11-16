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
  final ResponseCharacters responseData;
  final bool? isLoading;

  CharacterBlocStateSucess({
    required this.responseData,
    this.isLoading = false,
  });

  CharacterBlocStateSucess copyWith({
    ResponseCharacters? responseData,
    bool? isLoading,
  }) {
    return CharacterBlocStateSucess(
      responseData: responseData ?? this.responseData,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [responseData, isLoading];
}
