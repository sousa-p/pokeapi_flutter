import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/controllers/index_controller.dart';
import 'package:pokeapi_flutter/src/views/components/index/main_component.dart';
import 'package:pokeapi_flutter/src/views/components/shared/error_component.dart';
import 'package:pokeapi_flutter/src/views/components/shared/loading_component.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  final IndexController controller = IndexController();

  _stateManagement(IndexState state) {
    switch (state) {
      case IndexState.loading:
        return const LoadingComponent();
      case IndexState.success:
        return MainComponent(
          pokemons: controller.loadedPokemons,
          handleScroll: () {
            setState(() {
              controller.loadMore();
            });
          },
        );
      default:
        return ErrorComponent(handleClick: () async => controller.init());
    }
  }

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) => _stateManagement(controller.state.value)),
    );
  }
}
