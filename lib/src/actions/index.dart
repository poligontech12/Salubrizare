export 'coordinates/index.dart';

abstract class AppAction {
  const AppAction();
}

abstract class ErrorAction extends AppAction {
  const ErrorAction();
}

typedef ActionResponse = void Function(AppAction action);
