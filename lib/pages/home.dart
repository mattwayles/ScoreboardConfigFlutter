import 'package:flutter/material.dart';

import './bluetooth/bluetooth_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: Image.asset("assets/astlogo.png")),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Text("AST Scoreboard Config",
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
            padding: EdgeInsets.all(50.0),
            child: Text(
                "Configure your AST Scoreboard using a bluetooth connection. Press the SCAN button below to locate your AST Scoreboard!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey))),

        //TODO: Get rid of this button, replace with a timeout
        RaisedButton(
            color: Theme.of(context).buttonColor,
            child: Text("SCAN", style: TextStyle(color: Theme.of(context).primaryColorDark)),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => BluetoothManager()))),
      ],
    ));
  }
}
