import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flumo_flutter_example/core/widgets/neo_brutal_app_bar.dart';
import 'package:flumo_flutter_example/features/map_cluster/data/dummy_city_repository.dart';
import 'package:flumo_flutter_example/core/theme/app_colors.dart';
import 'package:flumo_flutter_example/features/map_cluster/presentation/widgets/map_marker_pin.dart';
import 'package:flumo_flutter_example/features/map_cluster/presentation/widgets/poi_card.dart';
import 'package:flumo_flutter_example/features/map_cluster/presentation/widgets/wave_animation.dart';

/// A page that demonstrates map marker clustering with interactive POI list.
///
/// This feature includes:
/// * Marker clustering with custom pin design.
/// * Custom map tiles using Carto basemaps.
/// * Horizontal list of POIs (Points of Interest) at the bottom.
/// * Interaction to pan the map to a specific POI when its card is tapped.
class MapClusterPage extends StatefulWidget {
  /// Creates a [MapClusterPage].
  const MapClusterPage({super.key});

  @override
  State<MapClusterPage> createState() => _MapClusterPageState();
}

class _MapClusterPageState extends State<MapClusterPage> {
  /// Controller to manage map camera movements.
  final MapController _mapController = MapController();

  /// Repository providing dummy city and POI data.
  final DummyCityRepository _repo = DummyCityRepository();

  /// Generates a list of [Marker] widgets from the repository data.
  List<Marker> _markers() {
    final cities = _repo.getAll();
    final points = cities.expand((c) => c.points.map((e) => e.toLatLng()));
    return points
        .map(
          (p) => Marker(
            point: p,
            width: 40,
            height: 52,
            alignment: Alignment.bottomCenter,
            child: const MapMarkerPin(
              size: 40,
              child: Icon(
                Icons.person,
                color: AppColors.seed,
                size: 20,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final markers = _markers();
    final cities = _repo.getAll();
    final allLatLng = cities.expand((c) => c.points.map((e) => e.toLatLng())).toList();
    final bounds = LatLngBounds.fromPoints(allLatLng);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const NeoBrutalAppBar(title: 'Map Cluster', colorSeedIndex: 2),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCameraFit: CameraFit.bounds(
                bounds: bounds,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'studio.flumo.example',
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  maxClusterRadius: 60,
                  size: const Size(48, 48),
                  markers: markers,
                  builder: (context, cluster) {
                    return WaveAnimation(
                      size: 40,
                      color: Colors.blueGrey.withValues(alpha: 0.3),
                      centerChild: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          cluster.length.toString(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 120,
                child: Builder(
                  builder: (context) {
                    final flat = cities.expand((c) => c.points.map((p) => (c.city, p))).toList();
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      itemCount: flat.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final (cityName, point) = flat[index];
                        return PoiCard(
                          point: point,
                          cityName: cityName,
                          onTap: () => _mapController.move(point.toLatLng(), 13),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
