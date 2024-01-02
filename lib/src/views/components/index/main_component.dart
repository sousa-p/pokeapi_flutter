import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

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
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.pokemons.length,
        itemBuilder: (context, index) {
          PokemonModel pokemon = widget.pokemons[index];

          return ListTile(
            title: Text(pokemon.name!),
          );
        });
  }
}
