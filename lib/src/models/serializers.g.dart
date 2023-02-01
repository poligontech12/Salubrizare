// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AppState.serializer)
      ..add(CoordinatesState.serializer)
      ..add(GeoPointModel.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(GeoPointModel)]),
          () => new ListBuilder<GeoPointModel>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
