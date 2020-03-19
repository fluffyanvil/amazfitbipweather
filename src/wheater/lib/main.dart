import 'package:flutter/material.dart';
import 'package:wheater/WheatherPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WheatherPage(title: 'Flutter Demo Home Page'),
    );
  }
}
