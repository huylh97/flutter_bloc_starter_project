import 'package:bloc/bloc.dart';
import 'package:hawker_merchant/app.dart';
import 'package:hawker_merchant/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    UtilLogger.log('${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    UtilLogger.log('${bloc.runtimeType}', change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    UtilLogger.log('${bloc.runtimeType}', error);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    UtilLogger.log('${bloc.runtimeType}');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: AppBlocObserver(),
  );
}
