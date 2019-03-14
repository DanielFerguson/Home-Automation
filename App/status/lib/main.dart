import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'secrets.dart';

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

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': mapbox_api,
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
}

class _MyHomePageState extends State<MyHomePage> {
  
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
                  'Status',
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
                  child: Map(),
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
