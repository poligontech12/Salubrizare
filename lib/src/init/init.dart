import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import '../actions/index.dart';
import '../data/coordinates_api.dart';
import '../epics/app_epics.dart';
import '../models/index.dart';
import '../reducer/reducer.dart';

Future<Store<AppState>> init() async {

  const String productsPath = 'lib/coordinates.gpx';

  const CoordinatesApi coordinatesApi = CoordinatesApi(coordinatesPath: productsPath);

  const AppEpics epics = AppEpics(coordinatesApi: coordinatesApi);
  final AppState initialState = AppState.initialState();

  return Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epics.epics),
    ],
  )
    ..dispatch(const GetCoordinates());
}
