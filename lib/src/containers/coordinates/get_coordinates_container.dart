part of coordinates_container;

class GetCoordinatesContainer extends StatelessWidget {
  const GetCoordinatesContainer({super.key, required this.builder});

  final ViewModelBuilder<List<GeoPointModel>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<GeoPointModel>>(
      converter: (Store<AppState> store) => store.state.coordinates.coordinates.asList(),
      builder: builder,
    );
  }
}
