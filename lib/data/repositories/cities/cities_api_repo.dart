import 'dart:async';

import 'package:transee/data/models/city.dart';
import 'cities_repo.dart';

class CitiesApiRepo implements CitiesRepo {
  @override
  Future<List<City>> getCities() {
    // TODO: Fetch cities from server
    return new Future.error(new Exception());
  }
}
