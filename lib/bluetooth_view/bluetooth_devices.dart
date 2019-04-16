import 'package:flutter/material.dart';

class BluetoothDevices extends StatelessWidget {
  final List<String> devices;

  BluetoothDevices([this.devices]);

  Widget _buildDeviceItem(BuildContext content, int index) {
    return Card(
      child: Text(devices[index])
    );
  }

  @override
  Widget build(BuildContext context) {
    return devices.length > 0 ? ListView.builder(
      itemBuilder: _buildDeviceItem, 
      itemCount: devices.length,) : Center(child: Text("No Devices Found"));
  }
}
