import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/core/presenter/widgets/bottom_loader_widget.dart';

import 'app/core/presenter/widgets/character_card_widget.dart';
import 'app/core/presenter/widgets/shimmer_card_widget.dart';
import 'app/modules/characters/domain/dtos/dtos.dart';
import 'app/modules/characters/domain/value_objects/limit.dart';
import 'app/modules/characters/presenter/character/bloc/character_bloc_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, CharacterBlocBloc> {
  late ScrollController _scrollController;

  // ignore: prefer_final_fields
  ValueNotifier<CharactersDto> _params = ValueNotifier(
    // ignore: prefer_const_constructors
    CharactersDto(
      // ignore: prefer_const_constructors
      limit: Limit(value: 20),
      offset: 0,
    ),
  );

  @override
  void initState() {
    super.initState();
    controller.add(FetchCharacterListEvent(params: _params.value));
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _params.value =
            _params.value.copyWith(offset: _params.value.offset + 20);
        controller.add(
          PaginateCharactersEvent(
            params: _params.value,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 300,
          leading: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "MARVEL APP",
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          title: const TextField(
            decoration: InputDecoration(
              hintText: 'Search for a hero...',
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CharacterBlocBloc, CharacterBlocState>(
          bloc: controller,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CharacterBlocStateLoading:
                return ListView.separated(
                  itemCount: (MediaQuery.of(context).size.height ~/ 220.0),
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 25,
                  ),
                  itemBuilder: (_, __) => const CharacterListShimmer(),
                );
              case CharacterBlocStateFailure:
                return const Center(child: Text('erro'));
              case CharacterBlocStateSucess:
                state as CharacterBlocStateSucess;
                return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.responseData.data.characters?.length,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, i) {
                      final character = state.responseData.data.characters?[i];
                      final listSize =
                          state.responseData.data.characters!.length;
                      return i + 1 >= listSize
                          ? const BottomLoaderWidget()
                          : CharacterCardWidget(
                              character: character,
                              onTap: () {
                                Modular.to.pushNamed('/details/',
                                    arguments: character);
                              });
                    });
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
