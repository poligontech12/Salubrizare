import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with OSMMixinObserver {
  late MapController controller;
  late GlobalKey<ScaffoldState> scaffoldKey;

  Key mapGlobalKey = UniqueKey();

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
    GeoPoint(latitude: 47.63413, longitude: 26.23566),
    GeoPoint(latitude: 47.64188, longitude: 26.23513),
    GeoPoint(latitude: 47.64676, longitude: 26.24713),
    GeoPoint(latitude: 47.64488, longitude: 26.26292),
    GeoPoint(latitude: 47.65618, longitude: 26.26129),
  ];

  bool isConstraintRoads = false;

  @override
  void initState() {
    super.initState();
    controller = MapController.withPosition(
      initPosition: GeoPoint(
        latitude: 47.63634,
        longitude: 26.22315,
      ),
    );
    controller.addObserver(this);
    scaffoldKey = GlobalKey<ScaffoldState>();
    // controller.listenerMapLongTapping.addListener(() async {
    //   if (controller.listenerMapLongTapping.value != null) {
    //     if (kDebugMode) {
    //       print('1: ${controller.listenerMapLongTapping.value}');
    //     }
    //     final String randNum = Random.secure().nextInt(100).toString();
    //     if (kDebugMode) {
    //       print(randNum);
    //     }
    //     await controller.addMarker(
    //       controller.listenerMapLongTapping.value!,
    //       markerIcon: MarkerIcon(
    //         iconWidget: SizedBox.fromSize(
    //           size: const Size.square(48),
    //           child: Stack(
    //             children: <Widget>[
    //               const Icon(
    //                 Icons.store,
    //                 color: Colors.brown,
    //                 size: 48,
    //               ),
    //               Text(
    //                 randNum,
    //                 style: const TextStyle(fontSize: 18),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       //angle: pi / 3,
    //     );
    //   }
    // });
    // controller.listenerMapSingleTapping.addListener(() async {
    //   if (controller.listenerMapSingleTapping.value != null) {
    //     if (kDebugMode) {
    //       print(controller.listenerMapSingleTapping.value);
    //     }
    //
    //     if (lastGeoPoint.value != null) {
    //       controller.changeLocationMarker(
    //         oldLocation: lastGeoPoint.value!,
    //         newLocation: controller.listenerMapSingleTapping.value!,
    //       );
    //     } else {
    //       await controller.addMarker(
    //         controller.listenerMapSingleTapping.value!,
    //         markerIcon: const MarkerIcon(
    //           icon: Icon(
    //             Icons.person_pin,
    //             color: Colors.red,
    //             size: 32,
    //           ),
    //         ),
    //         //angle: -pi / 4,
    //       );
    //     }
    //
    //     lastGeoPoint.value = controller.listenerMapSingleTapping.value;
    //   }
    // });
    // controller.listenerRegionIsChanging.addListener(() async {
    //   if (controller.listenerRegionIsChanging.value != null) {
    //     if (kDebugMode) {
    //       print(controller.listenerRegionIsChanging.value);
    //     }
    //     centerMap.value = controller.listenerRegionIsChanging.value!.center;
    //   }
    // });
  }

  Future<void> mapIsInitialized() async {
    await controller.setZoom(zoomLevel: 15);

    final BoundingBox bounds = await controller.bounds;
    if (kDebugMode) {
      print('2: $bounds');
    }

    // Future<void>.delayed(const Duration(seconds: 5), () {
    //   controller.changeTileLayer(tileLayer: CustomTile.cycleOSM());
    // });
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (!isReady) {
      return;
    }
    await mapIsInitialized();
    addMultiRoadConfiguration();
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
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          OSMFlutter(
            controller: controller,
            trackMyPosition: true,
            androidHotReloadSupport: true,
            mapIsLoading: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Text('Map is Loading..'),
                ],
              ),
            ),
            onMapIsReady: (bool isReady) {
              if (isReady && isConstraintRoads) {
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
                    scaleAssetImage: 0.45),
              ),
            ),
            showContributorBadgeForOSM: true,
            onLocationChanged: (GeoPoint myLocation) {
              if (kDebugMode) {
                print('3: $myLocation');
              }
            },
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
          iconWidget: Icon(
            Icons.person_pin,
            size: 50,
            color: Colors.blue,
          ),
        ),
      );
    }
  }

  void addMultiRoadConfiguration() async {
    await controller.myLocation().then((value) {
      print('Current location: $value');
      coordinates.insert(0, value);
      addMarkers();
      setState(() {
        isConstraintRoads = true;
      });

      List<MultiRoadConfiguration> configs = [];
      for (int i = 0; i < coordinates.length; i++) {
        if (coordinates.length > i + 1) {
          configs.add(MultiRoadConfiguration(startPoint: coordinates[i], destinationPoint: coordinates[i + 1]));
        } else {
          drawMultiRoads(configs);
        }
      }
    });
  }

  Future<void> drawMultiRoads(List<MultiRoadConfiguration> configs) async {
    final List<RoadInfo> listRoadInfo = await controller
        .drawMultipleRoad(
      configs,
      commonRoadOption: const MultiRoadOption(
        roadColor: Colors.redAccent,
      ),
    )
        .whenComplete(() => addMarkers());

    setState(() {});
    if (kDebugMode) {
      print(listRoadInfo);
    }
  }
}
