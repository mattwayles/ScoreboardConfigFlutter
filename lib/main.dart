import 'package:flutter/material.dart';

import './bluetooth_view/bluetooth_manager.dart';

void main() => runApp(ScoreboardConfig());

class ScoreboardConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(title: Text("AST Scoreboard")),

            //This will eventually become the second page of the app, once the splash page has been implemented
            body: BluetoothManager()));
  }
}
