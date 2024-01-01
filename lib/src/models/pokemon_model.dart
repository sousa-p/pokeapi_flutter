import 'package:pokeapi_flutter/src/models/stat_model.dart';

class PokemonModel {
  int? id;
  String? name;
  double? height;
  double? weight;
  String? sprite;
  List<StatModel> stats = [];
  List<PokemonModel> evolutions = [];
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
    evolutions = <PokemonModel>[];
    moves = <String>[];
    types = <String>[];
    weaknesses = <String>[];
    strengths = <String>[];
    abilities = <String>[];
  }

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height']?.toDouble();
    weight = json['weight']?.toDouble();
    sprite = json['sprites']?['front_default'];

    if (json['stats'] != null) {
      List statsList = json['stats'] as List;
      stats = statsList.map((e) => StatModel.fromJson(e)).toList();
    }

    if (json['evolutions'] != null) {
      List evolutionsList = json['evolutions'];
      evolutions = evolutionsList.map((e) => PokemonModel.fromJson(e)).toList();
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
    List weaknesses = [];

    for (var type in types) {
      weaknesses.addAll(allWeaknesses[type] ?? []);
    }

    return Set<String>.from(weaknesses).toList();
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

    List strengths = [];

    for (var type in types) {
      strengths.addAll(allStrengths[type] ?? []);
    }

    return Set<String>.from(strengths).toList();
  }
}