// GENERATED CODE - DO NOT MODIFY BY HAND

part of coordinates_models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GeoPointModel> _$geoPointModelSerializer =
    new _$GeoPointModelSerializer();
Serializer<CoordinatesState> _$coordinatesStateSerializer =
    new _$CoordinatesStateSerializer();

class _$GeoPointModelSerializer implements StructuredSerializer<GeoPointModel> {
  @override
  final Iterable<Type> types = const [GeoPointModel, _$GeoPointModel];
  @override
  final String wireName = 'GeoPointModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GeoPointModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  GeoPointModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GeoPointModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$CoordinatesStateSerializer
    implements StructuredSerializer<CoordinatesState> {
  @override
  final Iterable<Type> types = const [CoordinatesState, _$CoordinatesState];
  @override
  final String wireName = 'CoordinatesState';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoordinatesState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'coordinates',
      serializers.serialize(object.coordinates,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GeoPointModel)])),
      'isLoadingCoordinates',
      serializers.serialize(object.isLoadingCoordinates,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  CoordinatesState deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoordinatesStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'coordinates':
          result.coordinates.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GeoPointModel)]))!
              as BuiltList<Object?>);
          break;
        case 'isLoadingCoordinates':
          result.isLoadingCoordinates = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GeoPointModel extends GeoPointModel {
  @override
  final int id;
  @override
  final double latitude;
  @override
  final double longitude;

  factory _$GeoPointModel([void Function(GeoPointModelBuilder)? updates]) =>
      (new GeoPointModelBuilder()..update(updates))._build();

  _$GeoPointModel._(
      {required this.id, required this.latitude, required this.longitude})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GeoPointModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'GeoPointModel', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'GeoPointModel', 'longitude');
  }

  @override
  GeoPointModel rebuild(void Function(GeoPointModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeoPointModelBuilder toBuilder() => new GeoPointModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeoPointModel &&
        id == other.id &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeoPointModel')
          ..add('id', id)
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class GeoPointModelBuilder
    implements Builder<GeoPointModel, GeoPointModelBuilder> {
  _$GeoPointModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  GeoPointModelBuilder();

  GeoPointModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeoPointModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeoPointModel;
  }

  @override
  void update(void Function(GeoPointModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeoPointModel build() => _build();

  _$GeoPointModel _build() {
    final _$result = _$v ??
        new _$GeoPointModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GeoPointModel', 'id'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'GeoPointModel', 'latitude'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'GeoPointModel', 'longitude'));
    replace(_$result);
    return _$result;
  }
}

class _$CoordinatesState extends CoordinatesState {
  @override
  final BuiltList<GeoPointModel> coordinates;
  @override
  final bool isLoadingCoordinates;

  factory _$CoordinatesState(
          [void Function(CoordinatesStateBuilder)? updates]) =>
      (new CoordinatesStateBuilder()..update(updates))._build();

  _$CoordinatesState._(
      {required this.coordinates, required this.isLoadingCoordinates})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        coordinates, r'CoordinatesState', 'coordinates');
    BuiltValueNullFieldError.checkNotNull(
        isLoadingCoordinates, r'CoordinatesState', 'isLoadingCoordinates');
  }

  @override
  CoordinatesState rebuild(void Function(CoordinatesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoordinatesStateBuilder toBuilder() =>
      new CoordinatesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoordinatesState &&
        coordinates == other.coordinates &&
        isLoadingCoordinates == other.isLoadingCoordinates;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, coordinates.hashCode);
    _$hash = $jc(_$hash, isLoadingCoordinates.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoordinatesState')
          ..add('coordinates', coordinates)
          ..add('isLoadingCoordinates', isLoadingCoordinates))
        .toString();
  }
}

class CoordinatesStateBuilder
    implements Builder<CoordinatesState, CoordinatesStateBuilder> {
  _$CoordinatesState? _$v;

  ListBuilder<GeoPointModel>? _coordinates;
  ListBuilder<GeoPointModel> get coordinates =>
      _$this._coordinates ??= new ListBuilder<GeoPointModel>();
  set coordinates(ListBuilder<GeoPointModel>? coordinates) =>
      _$this._coordinates = coordinates;

  bool? _isLoadingCoordinates;
  bool? get isLoadingCoordinates => _$this._isLoadingCoordinates;
  set isLoadingCoordinates(bool? isLoadingCoordinates) =>
      _$this._isLoadingCoordinates = isLoadingCoordinates;

  CoordinatesStateBuilder();

  CoordinatesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _coordinates = $v.coordinates.toBuilder();
      _isLoadingCoordinates = $v.isLoadingCoordinates;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoordinatesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoordinatesState;
  }

  @override
  void update(void Function(CoordinatesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoordinatesState build() => _build();

  _$CoordinatesState _build() {
    _$CoordinatesState _$result;
    try {
      _$result = _$v ??
          new _$CoordinatesState._(
              coordinates: coordinates.build(),
              isLoadingCoordinates: BuiltValueNullFieldError.checkNotNull(
                  isLoadingCoordinates,
                  r'CoordinatesState',
                  'isLoadingCoordinates'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'coordinates';
        coordinates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CoordinatesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
