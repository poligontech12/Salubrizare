part of coordinates_models;

abstract class CoordinatesState implements Built<CoordinatesState, CoordinatesStateBuilder> {
  factory CoordinatesState.initialState() {
    return _$CoordinatesState((CoordinatesStateBuilder b) {
      b.isLoadingCoordinates = false;
    });
  }

  factory CoordinatesState.fromJson(dynamic json) => serializers.deserializeWith(serializer, json) as CoordinatesState;

  CoordinatesState._();

  BuiltList<GeoPointModel> get coordinates;

  bool get isLoadingCoordinates;

  Map<String, dynamic>? get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>?;

  static Serializer<CoordinatesState> get serializer => _$coordinatesStateSerializer;
}
