import 'package:flutter/material.dart';

import 'package:transee/data/models/city.dart';
import 'choose_city_persenter.dart';

class ChooseCityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Choose city"),
        ),
        body: new CityList());
  }
}

class CityList extends StatefulWidget {
  CityList({Key key}) : super(key: key);

  @override
  _CityListState createState() => new _CityListState();
}

class _CityListState extends State<CityList> implements ChooseCityMvpView {
  ChooseCityPresenter _presenter;

  bool _loading;
  List<City> _cities;

  _CityListState() {
    _presenter = new ChooseCityPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.onInit();
  }

  @override
  void showLoading() {
    setState(() {
      _cities = [];
      _loading = true;
    });
  }

  void showCities(List<City> items) {
    setState(() {
      _cities = items;
      _loading = false;
    });
  }

  @override
  void showError(String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(message),
        action: new SnackBarAction(
            label: "Retry", onPressed: () => _presenter.onReloadCities()),
        duration: new Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      return new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _buildCitiesVoList());
    }
  }

  List<_CityListItem> _buildCitiesVoList() {
    return _cities.map((city) => new _CityListItem(city)).toList();
  }
}

class _CityListItem extends ListTile {
  _CityListItem(City city) : super(title: new Text(city.name));
}
