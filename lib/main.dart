import 'package:flutter/material.dart';

import './pages/home.dart';

void main() => runApp(ScoreboardConfig());

class ScoreboardConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: HomePage());
  }
}
