/// Immutable domain entity representing a single marker coordinate.
class CityMarkerEntity {
  /// Creates an entity with latitude and longitude in degrees.
  CityMarkerEntity({required this.lat, required this.lon, this.name, this.details});
  final double lat;
  final double lon;
  final String? name;
  final String? details;
}

/// Aggregated domain entity representing a city and its marker points.
class CityPointsEntity {
  /// Creates a city entity with a visual center and a list of marker points.
  CityPointsEntity({
    required this.city,
    required this.centerLat,
    required this.centerLon,
    required this.points,
  });
  final String city;
  final double centerLat;
  final double centerLon;
  final List<CityMarkerEntity> points;
}
