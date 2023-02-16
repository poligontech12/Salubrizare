import 'package:flutter/material.dart';

import '../pages/map/flutter_map_with_compass.dart';
import '../pages/map/flutter_osm_with_compass.dart';
import '../pages/map/flutter_map_with_location.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home_page = '/';
  static const String location = '/location';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
    home_page: (BuildContext context) => const FlutterOsmWithCompass(),
    // location: (BuildContext context) => const MyApp(),
  };
}
