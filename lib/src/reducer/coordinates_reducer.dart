import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

import '../actions/coordinates/index.dart';
import '../models/coordinates/index.dart';

Reducer<CoordinatesState> productsReducer = combineReducers(<Reducer<CoordinatesState>>[
  TypedReducer<CoordinatesState, GetCoordinatesStart>(_getCoordinatesStart),
  TypedReducer<CoordinatesState, GetCoordinatesSuccessful>(_getCoordinatesSuccessful),
]);

CoordinatesState _getCoordinatesStart(CoordinatesState state, GetCoordinatesStart action) {
  return state.rebuild((CoordinatesStateBuilder b) {
    b.isLoadingCoordinates = true;
  });
}

CoordinatesState _getCoordinatesSuccessful(CoordinatesState state, GetCoordinatesSuccessful action) {
  return state.rebuild((CoordinatesStateBuilder b) {
    b
      ..isLoadingCoordinates = false
      ..coordinates = ListBuilder<GeoPointModel>(action.coordinates);
  });
}
