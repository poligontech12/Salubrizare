part of coordinates_actions;

@freezed
abstract class GetCoordinates with _$GetCoordinates implements AppAction {
  const factory GetCoordinates() = GetCoordinatesStart;

  const factory GetCoordinates.successful(List<GeoPointModel> coordinates) = GetCoordinatesSuccessful;

  const factory GetCoordinates.error(Object error, StackTrace stackTrace) = GetCoordinatesError;
}
