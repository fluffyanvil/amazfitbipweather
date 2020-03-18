import 'package:flutter/material.dart';

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

class WheatherPage extends StatefulWidget {
  WheatherPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WheatherPageState createState() => _WheatherPageState();
}

class _WheatherPageState extends State<WheatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ));      
  }
}
