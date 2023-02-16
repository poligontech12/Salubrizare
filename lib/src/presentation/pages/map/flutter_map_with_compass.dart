// import 'package:flutter/material.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart' as Compass;
// import 'package:flutter_osrm/flutter_osrm.dart';
//
// class FlutterMapWithCompass extends StatefulWidget {
//   const FlutterMapWithCompass({
//     super.key,
//   });
//
//   @override
//   State<FlutterMapWithCompass> createState() => _FlutterMapWithCompassState();
// }
//
// class _FlutterMapWithCompassState extends State<FlutterMapWithCompass> {
//   bool _hasPermissions = false;
//   late MapController mapController;
//   LocationData? locationData;
//   late Location location;
//   late OSRM osrm;
//
//   @override
//   void initState() {
//     super.initState();
//     location = Location();
//     location.onLocationChanged.listen((LocationData event) {
//       locationData = event;
//     });
//
//     mapController = MapController();
//     osrm = OSRM.initialise();
//     print('Osrm: ${osrm.latLngsToPolyline([LatLng(47.648344030700606, 26.20236449140415), LatLng(47.655513508351575, 26.266565843951835)])}');
//
//     _fetchPermissionStatus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text('Flutter Compass'),
//         ),
//         body: Builder(
//           builder: (BuildContext context) {
//             if (_hasPermissions) {
//               return Column(
//                 children: <Widget>[
//                   _buildCompass(),
//                   Expanded(child: testMap()),
//                 ],
//               );
//             } else {
//               return _buildPermissionSheet();
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCompass() {
//     return StreamBuilder<CompassEvent>(
//       stream: FlutterCompass.events,
//       builder: (BuildContext context, AsyncSnapshot<CompassEvent> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error reading heading: ${snapshot.error}');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         final double? direction = snapshot.data!.heading;
//
//         if (direction == null) {
//           return const Center(
//             child: Text('Device does not have sensors !'),
//           );
//         }
//
//         // if (locationData != null && locationData!.speed! > 1) {
//         WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
//           // mapController.moveAndRotate(
//           //   LatLng(locationData!.latitude!, locationData!.longitude!),
//           //  14,
//           //   -direction,
//           // );
//           mapController.move(LatLng(locationData!.latitude!, locationData!.longitude!), mapController.zoom);
//           mapController.rotate(-direction);
//         });
//         // }
//
//         return Text(direction.toString());
//       },
//     );
//   }
//
//   Widget _buildPermissionSheet() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Location Permission Required'),
//           ElevatedButton(
//             child: Text('Request Permissions'),
//             onPressed: () {
//               Compass.Permission.locationWhenInUse.request().then((Compass.PermissionStatus ignored) {
//                 _fetchPermissionStatus();
//               });
//             },
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             child: Text('Open App Settings'),
//             onPressed: () {
//               Compass.openAppSettings().then((bool opened) {
//                 //
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _map() {
//     return FlutterMap(
//       options: MapOptions(
//         center: LatLng(locationData!.latitude!, locationData!.longitude!),
//         zoom: 14,
//       ),
//       mapController: mapController,
//       children: <Widget>[
//         // TileLayer(
//         // urlTemplate:,
//         // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
//
//         // ),
//         // MarkerLayer(
//         //   markers: <Marker>[
//         //     Marker(
//         //       width: 80,
//         //       height: 80,
//         //       point: LatLng(locationData!.latitude!, locationData!.longitude!),
//         //       rotate: true,
//         //       builder: (BuildContext ctx) => markerContainer(),
//         //     ),
//         //   ],
//         // )
//       ],
//     );
//   }
//
//   Widget testMap() {
//     return FlutterMap(
//       options: MapOptions(
//         center: LatLng(locationData!.latitude!, locationData!.longitude!),
//         zoom: 14,
//       ),
//       mapController: mapController,
//       layers: [
//         TileLayerOptions(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', subdomains: ['a', 'b', 'c']),
//         MarkerLayerOptions(
//           markers: <Marker>[
//             Marker(
//               width: 80,
//               height: 80,
//               point: LatLng(locationData!.latitude!, locationData!.longitude!),
//               rotate: true,
//               builder: (BuildContext ctx) => markerContainer(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget markerContainer() {
//     return SizedBox(
//       width: 20,
//       height: 30,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           Container(
//             width: 20,
//             height: 30,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(30),
//                 bottomLeft: Radius.circular(30),
//               ),
//               color: Colors.blue.withOpacity(0.2),
//             ),
//           ),
//           Container(
//             width: 20,
//             height: 20,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white.withOpacity(0.9),
//             ),
//             child: Center(
//               child: Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue.withOpacity(0.7),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _fetchPermissionStatus() {
//     Compass.Permission.locationWhenInUse.status.then((Compass.PermissionStatus status) {
//       if (mounted) {
//         setState(() => _hasPermissions = status == Compass.PermissionStatus.granted);
//       }
//     });
//   }
// }
