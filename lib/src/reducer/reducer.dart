import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import '../models/index.dart';
import 'coordinates_reducer.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  _reducer,
]);

AppState _reducer(AppState state, dynamic action) {
  if (kDebugMode) {
    print('action $action');
  }
  return state.rebuild((AppStateBuilder b) {
    b.coordinates = productsReducer(state.coordinates, action).toBuilder();
  });
}
