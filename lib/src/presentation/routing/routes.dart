import 'package:flutter/material.dart';

import '../pages/map/map_page.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home_page = '/';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
    home_page: (BuildContext context) => MapPage(),
  };
}
