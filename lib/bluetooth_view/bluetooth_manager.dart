import 'package:flutter/material.dart';

import './bluetooth_devices.dart';

///Handles all Bluetooth Management tasks, including searching, connecting, disconnecting, sending messages, etc.
class BluetoothManager extends StatefulWidget {
  final List<String> availableDevices = [];

  BluetoothManager() {
    startScan();
  }

  void startScan() {
    availableDevices.clear();
    //Kick off BT scan here. Add to devices for each found
    //TODO: Remove mock data
    availableDevices.add("scoreboard [AA:BB:CC:DD:EE:FF] 89%");
  }

  @override
  State<StatefulWidget> createState() {
    return _BluetoothManagerState();
  }
}

///Handles current Bluetooth state
class _BluetoothManagerState extends State<BluetoothManager> {
  List<String> _availableDevices;

  @override
  void initState() {
    super.initState();
    _availableDevices = widget.availableDevices;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () {
            setState(() {
              widget.startScan();
            });
          },
          child: Text("RESCAN"),
        )),
      Expanded(child: BluetoothDevices(_availableDevices)
      )
      ],
    );
  }
}
