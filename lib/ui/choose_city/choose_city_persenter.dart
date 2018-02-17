import 'package:transee/data/models/city.dart';
import 'package:transee/data/repositories/cities/cities_repo.dart';
import 'package:transee/injection/injection.dart';

abstract class ChooseCityMvpView {
  void showLoading();

  void showCities(List<City> items);

  void showError(String message);
}

class ChooseCityPresenter {
  ChooseCityMvpView _view;
  CitiesRepo _citiesRepo;

  ChooseCityPresenter(this._view) {
    _citiesRepo = new Injector().citiesRepo;
  }

  void onInit() {
    _loadCities();
  }

  void onReloadCities() {
    _loadCities();
  }

  void _loadCities() {
    _view.showLoading();
    _citiesRepo
        .getCities()
        .then((cities) => _view.showCities(cities))
        .catchError((onError) {
      print(onError);
      _view.showError("Server error");
    });
  }
}
