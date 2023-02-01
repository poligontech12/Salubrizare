import 'package:redux_epics/redux_epics.dart';

import 'package:rxdart/rxdart.dart';
import '../actions/index.dart';
import '../data/coordinates_api.dart';
import '../models/index.dart';

class CoordinatesEpics {
  const CoordinatesEpics({required CoordinatesApi api})
      : _api = api;

  final CoordinatesApi _api;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetCoordinatesStart>(_getCoordinatesStart),
    ]);
  }

  Stream<AppAction> _getCoordinatesStart(Stream<GetCoordinatesStart> actions, EpicStore<AppState> store) {
    return actions.flatMap((GetCoordinatesStart action) =>
        Stream<GetCoordinatesStart>.value(action)
            .asyncMap((GetCoordinatesStart action) => _api.getCoordinates())
            .map((List<GeoPointModel> productsCourse) => GetCoordinates.successful(productsCourse))
            .onErrorReturnWith((Object error, StackTrace t) => GetCoordinates.error(error, t)));
  }
}


