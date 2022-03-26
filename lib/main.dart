import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutte Demo",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _batteryLevel = 'Unknown battery level.';
  static const platform = MethodChannel('samples.flutter.dev/battery');
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
      print("${batteryLevel}");
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Method channal"),
      ),
      body: InkWell(
        child: Center(
          child: Container(
            width: 100,
            height: 40,
            color: Colors.grey,
            child: Center(child: Text("method channel")),
          ),
        ),
        onTap: () {
          _getBatteryLevel();
        },
      ),
    );
  }
}
