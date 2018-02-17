import 'dart:async';

import 'package:transee/data/models/city.dart';
import 'cities_repo.dart';

class CitiesMockRepo extends CitiesRepo {
  @override
  Future<List<City>> getCities() {
    return new Future.delayed(const Duration(seconds: 2), () => _mockCities());
  }

  List<City> _mockCities() {
    return [
      new City(id: "yaroslavl", name: "Yaroslavl"),
      new City(id: "barnaul", name: "Barnaul"),
      new City(id: "vladimir", name: "Vladimir"),
      new City(id: "moscow", name: "Moscow")
    ];
  }
}
