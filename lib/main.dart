import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'bootstrap.dart';

void main () async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  return bootstrap(widgetsBinding, Environment.dev);
}

