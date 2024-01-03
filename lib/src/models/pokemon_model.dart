import 'package:pokeapi_flutter/src/models/stat_model.dart';

class PokemonModel {
  int? id;
  String? name;
  double? height;
  double? weight;
  String? sprite;
  List<StatModel> stats = [];
  List<String> moves = [];
  List<String> types = [];
  List<String> weaknesses = [];
  List<String> strengths = [];
  List<String> abilities = [];

  PokemonModel({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.sprite,
  }) {
    stats = <StatModel>[];
    moves = <String>[];
    types = <String>[];
    weaknesses = <String>[];
    strengths = <String>[];
    abilities = <String>[];
  }

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = _capitalizeFirstLetter(json['name']);
    height = json['height']?.toDouble();
    weight = json['weight']?.toDouble();

    if (json['stats'] != null) {
      List statsList = json['stats'] as List;
      stats = statsList.map((e) => StatModel.fromJson(e)).toList();
    }

    if (json['moves'] != null) {
      List movesList = json['moves'];
      moves = movesList.map((e) => e['move']['name'] as String).toList();
    }

    if (json['types'] != null) {
      List typesList = json['types'];
      types = typesList.map((e) => e['type']['name'] as String).toList();
    }

    if (types.isNotEmpty) {
      weaknesses = _getWeaknesses();
      strengths = _getStrengths();
    }

    if (json['abilities'] != null) {
      List abilitiesList = json['abilities'];
      abilities = abilitiesList.map((e) => e['ability']['name'] as String).toList();
    }
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  List<String> _getWeaknesses() {
    final Map<String, List<String>> allWeaknesses = {
      'fire': ['water', 'ground', 'rock'],
      'water': ['electric', 'grass'],
      'electric': ['ground'],
      'grass': ['fire', 'ice', 'poison', 'flying', 'bug'],
      'ice': ['fire', 'fighting', 'rock', 'steel'],
      'fighting': ['flying', 'psychic', 'fairy'],
      'poison': ['ground', 'psychic'],
      'ground': ['water', 'grass', 'ice'],
      'flying': ['electric', 'ice', 'rock'],
      'psychic': ['bug', 'ghost', 'dark'],
      'bug': ['fire', 'flying', 'rock'],
      'rock': ['water', 'grass', 'fighting', 'ground', 'steel'],
      'ghost': ['ghost', 'dark'],
      'dragon': ['ice', 'dragon', 'fairy'],
      'dark': ['fighting', 'bug', 'fairy'],
      'steel': ['fire', 'fighting', 'ground'],
      'fairy': ['poison', 'steel']
    };
    List<String> weaknesses = [];

    for (var type in types) {
      weaknesses.addAll(allWeaknesses[type] ?? []);
    }

    return weaknesses.toSet().toList();
  }

  List<String> _getStrengths() {
    final Map<String, List<String>> allStrengths = {
      'fire': ['grass', 'ice', 'bug', 'steel'],
      'water': ['fire', 'ground', 'rock'],
      'electric': ['water', 'flying'],
      'grass': ['water', 'ground', 'rock'],
      'ice': ['grass', 'ground', 'flying', 'dragon'],
      'fighting': ['normal', 'ice', 'rock', 'dark', 'steel'],
      'poison': ['grass', 'fairy'],
      'ground': ['fire', 'electric', 'poison', 'rock', 'steel'],
      'flying': ['grass', 'fighting', 'bug'],
      'psychic': ['fighting', 'poison'],
      'bug': ['grass', 'psychic', 'dark'],
      'rock': ['fire', 'ice', 'flying', 'bug'],
      'ghost': ['psychic', 'ghost'],
      'dragon': ['dragon'],
      'dark': ['psychic', 'ghost'],
      'steel': ['ice', 'rock', 'fairy'],
      'fairy': ['fighting', 'dragon', 'dark']
    };

    List<String> strengths = [];

    for (var type in types) {
      strengths.addAll(allStrengths[type] ?? []);
    }

    return strengths.toSet().toList();
  }

  String getSpriteUrl() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  String getFormatedId() {
    return id.toString().padLeft(3, '0');
  }
}
