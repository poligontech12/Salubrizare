import 'dart:async';

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
  MapController controller = MapController();
  late GlobalKey<ScaffoldState> scaffoldKey;

  bool isGoToLocation = false;

  Key mapGlobalKey = UniqueKey();
  LocationData? locationData;
  Timer? timer;

  List<GeoPoint> coordinates = <GeoPoint>[
    GeoPoint(latitude: 47.62922, longitude: 26.21904),
    GeoPoint(latitude: 47.63359, longitude: 26.23148),
    GeoPoint(latitude: 47.64188, longitude: 26.23513),
    GeoPoint(latitude: 47.64676, longitude: 26.24713),
    GeoPoint(latitude: 47.64488, longitude: 26.26292),
    GeoPoint(latitude: 47.65618, longitude: 26.26129),
  ];

  List<LocationData> listLocationData = <LocationData>[];

  final Location location = Location();
  bool isCurrentLocation = false;

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
        // iconWidget: SizedBox(
        //   width: 40,
        //   height: 60,
        //   child: Center(
        //     child: Transform.rotate(
        //       angle: 0,
        //       child: Stack(
        //         alignment: Alignment.bottomCenter,
        //         children: <Widget>[
        //           Container(
        //             width: 40,
        //             height: 60,
        //             decoration: BoxDecoration(
        //               borderRadius: const BorderRadius.only(
        //                 bottomRight: Radius.circular(30),
        //                 bottomLeft: Radius.circular(30),
        //               ),
        //               color: Colors.blue.withOpacity(0.2),
        //             ),
        //           ),
        //           Container(
        //             width: 40,
        //             height: 40,
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: Colors.white.withOpacity(0.9),
        //             ),
        //             child: Center(
        //               child: Container(
        //                 width: 20,
        //                 height: 20,
        //                 decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   color: Colors.blue.withOpacity(0.7),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    location.getLocation().then((LocationData location) async {
      locationData = location;
      // controller.setZoom(zoomLevel: 19);
      // coordinates.insert(0, GeoPoint(latitude: location.latitude!, longitude: location.longitude!));

      controller.addObserver(this);
      scaffoldKey = GlobalKey<ScaffoldState>();
      setState(() {
        isCurrentLocation = true;
      });

      await controller.enableTracking();
      // await controller.currentLocation();
    });

    location.onLocationChanged.listen((LocationData newLocation) async {
      changeLocationMarker(newLocation);
      locationData = newLocation;
      // controller.setStaticPosition(
      //   <GeoPoint>[GeoPoint(latitude: newLocation.latitude!, longitude: newLocation.longitude!)],
      //   'currentLocation',
      // );
      // print('Current lat: ${newLocation.latitude}, long: ${newLocation.longitude}');


    });

    FlutterCompass.events!.listen((CompassEvent event) async {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
        // await controller.goToLocation(GeoPoint(latitude: locationData!.latitude!, longitude: locationData!.longitude!));
        await controller.rotateMapCamera(-event.heading!);
        print(event.heading);
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.goToLocation(GeoPoint(latitude: 47.6225488555408, longitude: 26.129408422826973));
          // setState(() {
          isGoToLocation = true;
          // });
        },
      ),
      body: Stack(
        children: <Widget>[
          if (isCurrentLocation)
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

  Widget markerLiveLocationContainer() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          width: 40,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: Colors.blue.withOpacity(0.2),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.9),
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
      ],
    );
  }

  Future<void> drawRoad() async {
    await controller.myLocation().then((GeoPoint value) async {
      final RoadInfo roadInfo = await controller.drawRoad(
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
      await controller.setZoom(zoomLevel: 20);
    });
  }
}
