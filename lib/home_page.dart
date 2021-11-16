import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/characters/domain/dtos/dtos.dart';
import 'package:marvel_api/app/modules/characters/domain/value_objects/limit.dart';
import 'app/modules/characters/presenter/character/bloc/character_bloc_bloc.dart';

import 'app/core/presenter/widgets/character_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, CharacterBlocBloc> {
  @override
  void initState() {
    controller.add(FetchCharacterListEvent(
        params: const CharactersDto(limit: Limit(value: 20), offset: 0)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CharacterBlocBloc, CharacterBlocState>(
      bloc: controller,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CharacterBlocInitial:
            return const Center(child: CircularProgressIndicator());
          case CharacterBlocStateLoading:
            return const Center(child: CircularProgressIndicator());
          case CharacterBlocStateFailure:
            return const Center(child: Text('erro'));
          case CharacterBlocStateSucess:
            state as CharacterBlocStateSucess;
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: state.responseData.data.characters?.length,
                    itemBuilder: (context, i) {
                      final character = state.responseData.data.characters?[i];
                      return CharacterCardWidget(
                          character: character, onTap: () {});
                    }));
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
