import 'package:flumo_flutter_example/features/map_cluster/data/dummy_city_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DummyCityRepository returns expected counts per city', () {
    final repo = DummyCityRepository();
    final cities = repo.getAll();
    final byCity = {for (final c in cities) c.city: c.points.length};
    expect(byCity['Jakarta'], 10);
    expect(byCity['Bandung'], 4);
    expect(byCity['Surabaya'], 7);
    expect(byCity['Yogyakarta'], 3);
    expect(byCity['Medan'], 5);
  });
}
