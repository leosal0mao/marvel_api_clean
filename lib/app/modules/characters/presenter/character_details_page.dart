import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/characters/presenter/character/bloc/character_bloc_bloc.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({Key? key}) : super(key: key);

  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState
    extends ModularState<CharacterDetailsPage, CharacterBlocBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBlocBloc, CharacterBlocState>(
        bloc: controller,
        builder: (context, state) {
          return Text('${state.props.length}');
        });
  }
}
