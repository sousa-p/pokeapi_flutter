import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/views/components/index/pokemon_card_component.dart';

class MainComponent extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final Function handleScroll;
  const MainComponent({super.key, required this.pokemons, required this.handleScroll});

  @override
  State<MainComponent> createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double cur = _scrollController.position.pixels;
    double limit = _scrollController.position.maxScrollExtent * .9;

    if (cur >= limit) widget.handleScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 23,
              runSpacing: 40,
              children: List.generate(
                widget.pokemons.length,
                (index) {
                  PokemonModel pokemon = widget.pokemons[index];
                  pokemon.id = index + 1;
                  return PokemonCardComponent(pokemon: pokemon);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
