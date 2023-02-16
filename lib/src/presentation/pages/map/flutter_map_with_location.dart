import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class TestMap2 extends StatefulWidget {
  const TestMap2({super.key});

  static const String route = 'polygon';

  @override
  State<TestMap2> createState() => _TestMap2State();
}

class _TestMap2State extends State<TestMap2> {
  late LocationData _currentPosition;
  // late String _address;
  Location location = Location();
  MapController mapController = MapController();
  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polygons')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(47.65747916093052, 26.217299030633153),
        ),
        mapController: mapController,
        children: <Widget>[
          // TileLayer(
          //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //   userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          // ),
        ],
      ),
    );
  }

  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        mapController.rotate(currentLocation.heading!);
        print(currentLocation.speed);
      });
    });
  }
}
