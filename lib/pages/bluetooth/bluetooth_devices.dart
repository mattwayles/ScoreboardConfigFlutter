import 'package:flutter/material.dart';

class BluetoothDevices extends StatelessWidget {
  final List<String> devices;

  BluetoothDevices([this.devices]);

  Widget _buildDeviceItem(BuildContext content, int index) {
    return Card(
      child: new InkWell(
        onTap: () {
          //TODO: Establish a connection to selected device
        },
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Text(devices[index]),
        ),
      ),
    );
  }

  Widget _buildDeviceList() {
    Widget deviceCard = Center(child: Text("No Devices Found"));

    if (devices.length > 0) {
      deviceCard = ListView.builder(
          itemBuilder: _buildDeviceItem, itemCount: devices.length);
    }

    return deviceCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildDeviceList();
  }
}
