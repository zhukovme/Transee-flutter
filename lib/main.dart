import 'package:flutter/material.dart';

import 'package:transee/injection/injection.dart';
import 'package:transee/ui/choose_city/choose_city_view.dart';

void main() {
  Injector.configure(Flavor.DEFAULT);
  runApp(new TranseeApp());
}

class TranseeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Transee',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey, accentColor: Colors.lightBlue),
      home: new ChooseCityPage(),
    );
  }
}
