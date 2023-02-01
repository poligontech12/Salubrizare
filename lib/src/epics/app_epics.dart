import 'package:redux_epics/redux_epics.dart';

import '../data/coordinates_api.dart';
import '../models/index.dart';
import 'coordinates_epics.dart';

class AppEpics {
  const AppEpics({required CoordinatesApi coordinatesApi})
      : _coordinatesApi = coordinatesApi;

  final CoordinatesApi _coordinatesApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      CoordinatesEpics(api: _coordinatesApi).epics,
    ]);
  }
}
