import 'package:flumo_flutter_example/core/routing/app_routes.dart';
import 'package:flumo_flutter_example/core/theme/app_theme.dart';
import 'package:flumo_flutter_example/features/home/presentation/home_page.dart';
import 'package:flumo_flutter_example/features/map/presentation/map_example_page.dart';
import 'package:flumo_flutter_example/features/map_cluster/presentation/map_cluster_page.dart';
import 'package:flumo_flutter_example/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';

/// Root application widget configuring global theming and routes.
class FlumoApp extends StatelessWidget {
  const FlumoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flumo Example',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,

      /// Declarative route table for example pages.
      routes: {
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.mapExample: (_) => const MapExamplePage(),
        AppRoutes.mapCluster: (_) => const MapClusterPage(),
      },
    );
  }
}
