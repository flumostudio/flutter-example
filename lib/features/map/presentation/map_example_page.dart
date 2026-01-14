import 'package:flutter/material.dart';
import 'package:flumo_flutter_example/core/widgets/neo_brutal_app_bar.dart';

/// Placeholder page for the map feature without external plugins.
class MapExamplePage extends StatelessWidget {
  const MapExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NeoBrutalAppBar(title: 'Map Example', colorSeedIndex: 1),
      body: Center(
        child: Text('Map example placeholder'),
      ),
    );
  }
}
