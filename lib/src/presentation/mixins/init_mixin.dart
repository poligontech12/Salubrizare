import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../../init/init.dart';
import '../../models/index.dart';


mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();

    _initStore();
  }

  Future<void> _initStore() async {
    final List<dynamic> result = await Future.wait<dynamic>(<Future<void>>[
      init(),
      // Future<void>.delayed(const Duration(seconds: 2),),
    ]);

    _completer.complete(result[0] as Store<AppState>);
  }

  Future<Store<AppState>> get future => _completer.future;
}
