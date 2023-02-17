import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart';

class FlutterOsmWithCompass extends StatefulWidget {
  const FlutterOsmWithCompass({super.key});

  @override
  State<FlutterOsmWithCompass> createState() => _FlutterOsmWithCompassState();
}

class _FlutterOsmWithCompassState extends State<FlutterOsmWithCompass> with OSMMixinObserver {
  late MapController controller;
  Location location = Location();
  bool _mapIsReady = false;
  Timer? timer;

  List<GeoPoint> coordinates = <GeoPoint>[
    GeoPoint(latitude: 47.62922, longitude: 26.21904),
    GeoPoint(latitude: 47.63359, longitude: 26.23148),
    GeoPoint(latitude: 47.64188, longitude: 26.23513),
    GeoPoint(latitude: 47.64676, longitude: 26.24713),
    GeoPoint(latitude: 47.64488, longitude: 26.26292),
    GeoPoint(latitude: 47.65618, longitude: 26.26129),
  ];

  void changeLocationMarker(LocationData newLocation) {
    controller.setStaticPosition(
      <GeoPoint>[GeoPoint(latitude: newLocation.latitude!, longitude: newLocation.longitude!)],
      'currentLocation',
    );

    controller.setMarkerOfStaticPoint(
      id: 'currentLocation',
      markerIcon: MarkerIcon(
        icon: Icon(
          Icons.person,
          color: Colors.transparent,
        ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    location.getLocation().then((LocationData location) async {
      controller.addObserver(this);
      coordinates.insert(0, GeoPoint(latitude: location.latitude!, longitude: location.longitude!));
      await drawRoad();
      // await controller.enableTracking();
    });

    location.onLocationChanged.listen((LocationData newLocation) async => changeLocationMarker(newLocation));

    FlutterCompass.events!.listen((CompassEvent event) async {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
        await controller.rotateMapCamera(-event.heading!);
        log('${event.heading}');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    controller = MapController();
    controller.addObserver(this);
    _mapIsReady = true;
  }

  Future<void> mapIsInitialized() async {
    await controller.setZoom(zoomLevel: 15);
    await getCurrentLocation();
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (!isReady) {
      return;
    }

    await mapIsInitialized();
  }

  @override
  void dispose() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    super.dispose();
  }

  Future<void> drawRoad() async {
    await controller.myLocation().then((GeoPoint value) async {
      await controller.drawRoad(
        coordinates[0],
        coordinates[coordinates.length - 1],
        roadType: RoadType.car,
        intersectPoint: coordinates,
        roadOption: const RoadOption(
          roadWidth: 10,
          roadColor: Colors.blue,
          showMarkerOfPOI: true,
        ),
      );

      await controller.setStaticPosition(coordinates, '0');
      // await controller.setZoom(zoomLevel: 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (_mapIsReady)
            OSMFlutter(
              controller: controller,
              trackMyPosition: true,
              showDefaultInfoWindow: true,
              androidHotReloadSupport: true,
              // initZoom: 15,
              minZoomLevel: 10,
              maxZoomLevel: 19,
              userLocationMarker: UserLocationMaker(
                personMarker: MarkerIcon(
                  assetMarker: AssetMarker(
                    image: const AssetImage('assets/gpsX20.png'),
                    scaleAssetImage: 0.2,
                  ),
                ),
                directionArrowMarker: MarkerIcon(
                  assetMarker: AssetMarker(
                    image: const AssetImage(
                      'assets/gpsX20.png',
                    ),
                    scaleAssetImage: 0.2,
                  ),
                ),
              ),
              onLocationChanged: (GeoPoint myLocation) async {
                if (kDebugMode) {
                  print('3: $myLocation');
                  controller.goToLocation(GeoPoint(latitude: myLocation.latitude, longitude: myLocation.longitude));
                }
              },
            ),
          if (!_mapIsReady)
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 30),
                    Text(
                      'Loading your current location and building a road ...',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
