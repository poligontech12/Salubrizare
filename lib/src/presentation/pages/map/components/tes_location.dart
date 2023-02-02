import 'package:flutter/material.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:location/location.dart';

import 'location_service.dart';

class TestLocation extends StatefulWidget {
  const TestLocation({super.key});

  @override
  State<TestLocation> createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  String? lat, long, country, adminArea;
  double? heading;

  late Location location;

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Latitude: ${lat ?? 'Loading ...'}', style: getStyle()),
            Text('Longitude: ${long ?? 'Loading ...'}', style: getStyle()),
            Text('Country: ${country ?? 'Loading ...'}', style: getStyle()),
            Text('Admin area: ${adminArea ?? 'Loading ...'}', style: getStyle()),
            Text('Heading: ${heading ?? 'Loading ...'}', style: getStyle()),
          ],
        ),
      ),
    );
  }

  TextStyle getStyle({double size = 16}) => TextStyle(fontSize: size, fontWeight: FontWeight.bold);

  Future<void> getLocation() async {
    final LocationService service = LocationService();
    final LocationData? locationData = await service.getLocation();

    location = Location();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        heading = currentLocation.heading;
        lat = currentLocation.latitude?.toStringAsFixed(5);
        long = currentLocation.longitude?.toStringAsFixed(5);
      });
    });

    if (locationData != null) {
      final Placemark? placeMark = await service.getPlaceMark(locationData: locationData);

      setState(() {
        lat = locationData.latitude?.toStringAsFixed(5);
        long = locationData.longitude?.toStringAsFixed(5);
        country = placeMark?.country;
        adminArea = placeMark?.administrativeArea;
        heading = locationData.heading;
      });
    }
  }
}
