import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
class WheatherPage extends StatefulWidget {
  WheatherPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WheatherPageState createState() => _WheatherPageState();
}

class _WheatherPageState extends State<WheatherPage> {
  FlutterBlue bluetoothInstance;
  BluetoothDevice device;
  BluetoothState state;
  BluetoothDeviceState deviceState;
  List<BluetoothService> services;
  StreamSubscription<ScanResult> scanSubscription;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {

      } else if (state == BluetoothState.on) {
        bluetoothInstance = FlutterBlue.instance;
        scanForDevices();
      }
    });
  }

  void scanForDevices() {
    scanSubscription = bluetoothInstance.scan().listen((scanResult) async {
      print(scanResult.device.name);
      if (scanResult.device.name == "Amazfit Bip Watch") {
        print("found target device");
        stopScanning();
        setState(() {
          device = scanResult.device;
        });
        connectToDevice();
      }
    });

  }

    void connectToDevice() async {
    await device.connect();
    List<BluetoothService> srv = await device.discoverServices();
    setState(() {
      services = srv;
    });
  }

  void stopScanning() {
    bluetoothInstance.stopScan();
    scanSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ));      
  }
}