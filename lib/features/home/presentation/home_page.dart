import 'package:flumo_flutter_example/core/routing/app_routes.dart';
import 'package:flumo_flutter_example/features/home/domain/menu_item.dart';
import 'package:flumo_flutter_example/features/home/presentation/widgets/menu_item_card.dart';
import 'package:flutter/material.dart';

/// Home page presenting a grid of example features.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Static list of navigable menu items for demonstration.
  List<MenuItem> _items() {
    return const [
      MenuItem(title: 'Splash', route: AppRoutes.splash, icon: Icons.bolt),
      MenuItem(title: 'Map', route: AppRoutes.mapExample, icon: Icons.map),
      MenuItem(title: 'Map Cluster', route: AppRoutes.mapCluster, icon: Icons.scatter_plot),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _items();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.05,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return MenuItemCard(
              item: item,
              index: index,
              onTap: () {
                Navigator.of(context).pushNamed(item.route);
              },
            );
          },
        ),
      ),
    );
  }
}
