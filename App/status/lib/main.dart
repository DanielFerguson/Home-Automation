import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Falling Downs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class WeatherDay extends StatelessWidget {
  // TODO: Add animations to icons - sun rotates, etc.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                size: 30,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Monday',
              style: TextStyle(
                fontSize: 12
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              '36°C',
              style: TextStyle(
                fontSize: 20
              )
            ),
          ),
        ],
      ),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Falling Downs
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Center(
                child: Text(
                  'FALLING DOWNS',
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
              ),
            ),

            // Weather Row
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WeatherDay(),
                  WeatherDay(),
                  WeatherDay(),
                  WeatherDay(),
                  WeatherDay(),
                ],
              ),
            ),

            // Hotspot Map
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Card(
                  child: Center(
                    child: Text(
                      'Map View'
                    ),
                  ),
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
