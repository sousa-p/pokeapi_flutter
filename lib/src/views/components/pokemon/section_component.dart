import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/about_component.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/moves.component.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/stats_component.dart';

class SectionComponent extends StatefulWidget {
  final PokemonModel pokemon;
  const SectionComponent({super.key, required this.pokemon});

  @override
  State<SectionComponent> createState() => _SectionComponentState();
}

class _SectionComponentState extends State<SectionComponent>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'About'),
    Tab(text: 'Stats'),
    Tab(text: 'Moves')
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.pokemon.getColors(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            indicatorColor: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 64),
          child: TabBarView(controller: _tabController, children: [
            AboutComponent(pokemon: widget.pokemon),
            StatsComponent(pokemon: widget.pokemon),
            MovesComponent(pokemon: widget.pokemon)
          ]),
        ));
  }
}
