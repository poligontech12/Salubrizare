import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'src/models/index.dart';
import 'src/presentation/mixins/init_mixin.dart';
import 'src/presentation/routing/routes.dart';

class NoThumbScrollBehavior extends ScrollBehavior {
  @override

  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.invertedStylus,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.unknown,
  };
}

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with InitMixin<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data!;

          return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
              // initialRoute: '/location',
              routes: AppRoutes.routes,
            ),
          );
        } else {
          if (snapshot.hasError) {
            // ignore: only_throw_errors
            throw snapshot.error!;
          }

          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: FlutterLogo(),
              ),
            ),
          );
        }
      },
    );
  }
}
