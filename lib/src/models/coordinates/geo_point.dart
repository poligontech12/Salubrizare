part of coordinates_models;

abstract class GeoPointModel implements Built<GeoPointModel, GeoPointModelBuilder> {
  factory GeoPointModel([void Function(GeoPointModelBuilder)? updates]) = _$GeoPointModel;

  factory GeoPointModel.fromJson(dynamic json) => serializers.deserializeWith(serializer, json) as GeoPointModel;

  factory GeoPointModel.fromData({
    required int id,
    required double latitude,
    required double longitude,
  }) {
    return _$GeoPointModel((GeoPointModelBuilder b) {
      b
        ..id = id
        ..latitude = latitude
        ..longitude = longitude;
    });
  }

  GeoPointModel._();

  int get id;

  double get latitude;

  double get longitude;

  Map<String, dynamic>? get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>?;

  static Serializer<GeoPointModel> get serializer => _$geoPointModelSerializer;
}
