import 'package:latlong2/latlong.dart';
import 'package:flumo_flutter_example/features/map_cluster/domain/city_entities.dart';

/// DTO model for a marker, used by the data layer.
class CityMarkerModel {
  const CityMarkerModel({required this.lat, required this.lon, this.name, this.details});
  final double lat;
  final double lon;
  final String? name;
  final String? details;

  /// Converts to LatLng for FlutterMap usage.
  LatLng toLatLng() => LatLng(lat, lon);

  /// Converts to the domain entity.
  CityMarkerEntity toEntity() => CityMarkerEntity(lat: lat, lon: lon, name: name, details: details);
}

/// DTO model for a city and its list of markers.
class CityPointsModel {
  const CityPointsModel({
    required this.city,
    required this.centerLat,
    required this.centerLon,
    required this.points,
  });
  final String city;
  final double centerLat;
  final double centerLon;
  final List<CityMarkerModel> points;

  /// Returns the visual center of the city.
  LatLng center() => LatLng(centerLat, centerLon);

  /// Converts to the domain entity for business logic usage.
  CityPointsEntity toEntity() => CityPointsEntity(
        city: city,
        centerLat: centerLat,
        centerLon: centerLon,
        points: points.map((e) => e.toEntity()).toList(),
      );
}
