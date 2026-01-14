import 'package:flumo_flutter_example/core/theme/neo_brutal_theme.dart';
import 'package:flumo_flutter_example/features/map_cluster/data/city_models.dart';
import 'package:flutter/material.dart';

/// A widget that displays POI information in a card style.
///
/// This card follows the Neo-Brutalism design system with a clean and warm style.
/// It shows the location name, details, and coordinates.
class PoiCard extends StatelessWidget {
  /// Creates a [PoiCard].
  const PoiCard({
    required this.point,
    required this.cityName,
    this.onTap,
    super.key,
  });

  /// The marker data model containing location details.
  final CityMarkerModel point;

  /// The name of the city this point belongs to.
  final String cityName;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(8),
        decoration: NeoBrutalTheme.cleanCardWarm(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              point.name ?? '$cityName POI',
              style: const TextStyle(fontWeight: FontWeight.w800),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              point.details ?? 'No details',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              'Lat: ${point.lat.toStringAsFixed(5)}  ·  Lon: ${point.lon.toStringAsFixed(5)}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
