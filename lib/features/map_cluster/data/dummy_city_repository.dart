import 'dart:math';
import 'package:flumo_flutter_example/features/map_cluster/data/city_models.dart';

/// In-memory repository supplying deterministic dummy city data for examples.
class DummyCityRepository {
  /// Returns a fixed set of cities with jittered marker points around each center.
  List<CityPointsModel> getAll() {
    final rnd = Random(42);
    CityPointsModel build(String name, double lat, double lon, int count) {
      final pts = List.generate(count, (i) {
        final dx = (rnd.nextDouble() - 0.5) * 0.02;
        final dy = (rnd.nextDouble() - 0.5) * 0.02;
        return CityMarkerModel(
          lat: lat + dy,
          lon: lon + dx,
          name: '$name POI ${i + 1}',
          details: 'Sample point of interest near $name (#${i + 1})',
        );
      });
      return CityPointsModel(city: name, centerLat: lat, centerLon: lon, points: pts);
    }

    return [
      build('Jakarta', -6.1754, 106.8272, 10),
      build('Bandung', -6.9175, 107.6191, 4),
      build('Surabaya', -7.2575, 112.7521, 7),
      build('Yogyakarta', -7.7956, 110.3695, 3),
      build('Medan', 3.5952, 98.6722, 5),
      build('Semarang', -6.9667, 110.4167, 6),
      build('Makassar', -5.1477, 119.4327, 5),
      build('Denpasar', -8.6500, 115.2167, 3),
      build('Balikpapan', -1.2635, 116.8270, 4),
      build('Palembang', -2.9761, 104.7754, 4),
    ];
  }
}
