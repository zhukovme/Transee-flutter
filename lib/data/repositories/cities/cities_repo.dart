import 'dart:async';

import 'package:transee/data/models/city.dart';

abstract class CitiesRepo {
  Future<List<City>> getCities();
}
