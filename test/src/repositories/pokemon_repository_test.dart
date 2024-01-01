import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/repositories/pokemon_repository.dart';

void main() {
  final PokemonRepository repository = PokemonRepository();
  test('Trazer uma lista dos 20 primeiros pokemons', () async {
    List<PokemonModel> pokemons = await repository.getPokemons();
    expect(20, pokemons.length);
    expect('bulbasaur', pokemons[0].name);
  });

  test('Trazer uma lista dos 40 primeiros pokemons', () async {
    List<PokemonModel> pokemons = await repository.getPokemons(limit: 40);
    expect(40, pokemons.length);
    expect('wigglytuff', pokemons[39].name);
  });

  test('Trazer uma lista do pokemon de id 20 ao 50', () async {
    List<PokemonModel> pokemons = await repository.getPokemons(offset: 20, limit: 30);
    expect(30, pokemons.length);
    expect('spearow', pokemons[0].name);
  });

  test('Trazer um pokemon pelo id', () async {
    PokemonModel pokemon = await repository.getPokemon(150);
    expect('mewtwo', pokemon.name);
  });

  test('Trazer um pokemon pelo nome', () async {
    PokemonModel pokemon = await repository.getPokemon('pikachu');
    expect(25, pokemon.id);
  });
}
