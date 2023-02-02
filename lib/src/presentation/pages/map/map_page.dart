import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:location/location.dart';

import '../../../models/coordinates/index.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with OSMMixinObserver {
  late MapController controller;
  late GlobalKey<ScaffoldState> scaffoldKey;

  Key mapGlobalKey = UniqueKey();

  double angleCamera = 0.0;

  ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> visibilityZoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> visibilityOSMLayers = ValueNotifier(false);
  ValueNotifier<double> positionOSMLayers = ValueNotifier(-200);
  ValueNotifier<GeoPoint?> centerMap = ValueNotifier(null);
  ValueNotifier<bool> trackingNotifier = ValueNotifier(false);
  ValueNotifier<bool> showFab = ValueNotifier(true);
  ValueNotifier<GeoPoint?> lastGeoPoint = ValueNotifier(null);
  Timer? timer;

  int x = 0;

  List<GeoPoint> coordinates = <GeoPoint>[
    GeoPoint(latitude: 47.62922, longitude: 26.21904),
    GeoPoint(latitude: 47.63359, longitude: 26.23148),
    GeoPoint(latitude: 47.64188, longitude: 26.23513),
    GeoPoint(latitude: 47.64676, longitude: 26.24713),
    GeoPoint(latitude: 47.64488, longitude: 26.26292),
    GeoPoint(latitude: 47.65618, longitude: 26.26129),
  ];

  // bool isConstraintRoads = false;
  GeoPoint? _currentLocation;

  bool isCurrentLocation = false;
  void getCurrentLocation() {
    final Location location = Location();

    location.getLocation().then((LocationData location) {
      _currentLocation = GeoPoint(latitude: location.latitude!, longitude: location.longitude!);

      controller = MapController.withPosition(
        initPosition: GeoPoint(latitude: location.latitude!, longitude: location.longitude!),
      );
      controller.addObserver(this);
      scaffoldKey = GlobalKey<ScaffoldState>();
      setState(() {

      isCurrentLocation = true;
      });
    });

    location.onLocationChanged.listen((LocationData newLocation) {
      controller.setStaticPosition(
        <GeoPoint>[GeoPoint(latitude: newLocation.latitude!, longitude: newLocation.longitude!)],
        'currentLocation',
      );
      controller.setMarkerOfStaticPoint(
        id: 'currentLocation',
        markerIcon: MarkerIcon(
          iconWidget: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      );

      _currentLocation = GeoPoint(latitude: newLocation.latitude!, longitude: newLocation.longitude!);
      // controller.rotateMapCamera(newLocation.heading!);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> mapIsInitialized() async {
    await controller.setZoom(zoomLevel: 15);
    final BoundingBox bounds = await controller.bounds;
    if (kDebugMode) {
      print('2: $bounds');
    }
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (!isReady) {
      return;
    }

    await mapIsInitialized();
    drawRoad();
  }

  @override
  void dispose() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    super.dispose();
  }

  List<GeoPoint> setCoordinates(List<GeoPointModel> list) {
    List<GeoPoint> tmpList = <GeoPoint>[];

    for (final GeoPointModel item in list) {
      tmpList.add(GeoPoint(latitude: item.latitude, longitude: item.longitude));
    }

    return tmpList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          if (isCurrentLocation)
          OSMFlutter(
            controller: controller,
            trackMyPosition: true,
            androidHotReloadSupport: true,
            onMapIsReady: (bool isReady) {
              if (isReady) {
                if (kDebugMode) {
                  print('map is ready');
                }
              }
            },
            initZoom: 15,
            minZoomLevel: 10,
            maxZoomLevel: 19,
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin,
                  color: Colors.transparent,
                  size: 48,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                assetMarker: AssetMarker(
                  image: const AssetImage(
                    'asset/taxi.png',
                  ),
                  scaleAssetImage: 0.45,
                ),
              ),
            ),
            onLocationChanged: (GeoPoint myLocation) {
              if (kDebugMode) {
                print('3: $myLocation');
              }
            },
          ),
          if (!isCurrentLocation)
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

  void addMarkers() {
    for (int i = 0; i < coordinates.length; i++) {
      controller.addMarker(
        coordinates[i],
        markerIcon: MarkerIcon(
          iconWidget: Stack(
            children: const <Widget>[
              Icon(
                Icons.location_on,
                size: 50,
                color: Colors.red,
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> drawRoad() async {
    await controller.myLocation().then((GeoPoint value) async {
      // isConstraintRoads = true;
      // coordinates.insert(0, value);

      final RoadInfo roadInfo = await controller.drawRoad(
        coordinates[0],
        coordinates[coordinates.length - 1],
        roadType: RoadType.foot,
        intersectPoint: coordinates,
        roadOption: const RoadOption(
          roadWidth: 10,
          roadColor: Colors.blue,
          showMarkerOfPOI: true,
        ),
      );
      await controller.setStaticPosition(coordinates, '0');
      await controller.setZoom(zoomLevel: 20);

      // print("${roadInfo.distance}km");
      // print("${roadInfo.duration}sec");
    });
  }
}
