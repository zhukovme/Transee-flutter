import 'package:transee/data/repositories/cities/cities_api_repo.dart';
import 'package:transee/data/repositories/cities/cities_mock_repo.dart';
import 'package:transee/data/repositories/cities/cities_repo.dart';

enum Flavor {
  MOCK,
  DEFAULT
}

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CitiesRepo get citiesRepo {
    switch(_flavor) {
      case Flavor.MOCK: return new CitiesMockRepo();
      default:
        return new CitiesApiRepo();
    }
  }
}