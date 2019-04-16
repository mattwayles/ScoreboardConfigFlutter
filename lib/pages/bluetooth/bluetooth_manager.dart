import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import './bluetooth_devices.dart';

///Handles all Bluetooth Management tasks, including searching, connecting, disconnecting, sending messages, etc.
class BluetoothManager extends StatefulWidget {
  final List<String> availableDevices = [];
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  ///Bluetooth Manager Constructor
  BluetoothManager() {

    flutterBlue.isAvailable.then((res) {
      print("Bluetooth is available, start scan");
      flutterBlue.isOn.then((isOn) {
        print("Bluetooth is On. Start Scan");
        startScan();
      });
    }).catchError((err) {
      print("Bluetooth is not available");
      print(err);
    });
  }

  void startScan() {
    availableDevices.clear();

    //Kick off BT scan here. Add to devices for each found
    var scan = flutterBlue.scan();
    scan.listen((onData) {
      print("Found");
      print(onData);
    });

    flutterBlue.onStateChanged().listen((onData) {
      print(onData);
    });
    
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
    return Scaffold(
      appBar: AppBar(title: Text("Available Bluetooth Devices")),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).buttonColor,
                onPressed: () {
                  setState(() {
                    widget.startScan();
                  });
                },

                //TODO: Only render this if scan has completed. Else, render "Scanning..."
                child: Text("RESCAN",
                    style:
                        TextStyle(color: Theme.of(context).primaryColorDark)),
              ),
            ),
          ),
          Expanded(child: BluetoothDevices(_availableDevices))
        ],
      ),
    );
  }
}
