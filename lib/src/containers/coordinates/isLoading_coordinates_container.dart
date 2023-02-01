part of coordinates_container;

class IsLoadingCoordinatesContainer extends StatelessWidget {
  const IsLoadingCoordinatesContainer({super.key, required this.builder});

  final ViewModelBuilder<bool> builder;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (Store<AppState> store) {
        return store.state.coordinates.isLoadingCoordinates;
      },
      builder: builder,
    );
  }
}
