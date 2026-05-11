import 'package:flutter_store_demo/core/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies({String? environment}) =>
    getIt.init(environment: environment);