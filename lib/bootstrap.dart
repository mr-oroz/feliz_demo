import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_store_demo/features/home/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/di/injector.dart';
import 'core/network/local_storage/local_storage.dart';
import 'features/app/app.dart';

Future<void> bootstrap(
  WidgetsBinding widgetsBinding,
  String environment,
) async {
  configureDependencies(environment: environment);
  await initializeDateFormatting('ru_RU');
  await dotenv.load(fileName: ".env");
  await LocalStorage.init();
  await Hive.initFlutter();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (_) => getIt<ProductBloc>()),
      ],
      child: MyApp(),
    ),
  );
}

// Future<void> initialHive() async {
//   // // адаптеры
//   if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(UserHiveAdapter());
//   if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(LoyaltyHiveAdapter());
//   if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(BranchesHiveAdapter());
//   if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(ProductHiveAdapter());
//   if (!Hive.isAdapterRegistered(4)) Hive.registerAdapter(ModifierHiveAdapter());
//   if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(SizesHiveAdapter());
//
//   // hive
//   await Hive.openBox('user_cache');
//   await Hive.openBox('branches_cache');
//   await Hive.openBox<ProductHive>('cart_box');
//   await Hive.openBox('settings_box');
// }

// Future<void> firebaseInitializeApp() async {
//   try {
//     if (Firebase.apps.isEmpty) {
//       await Firebase.initializeApp();
//     } else {
//       print('Firebase already initialized');
//     }
//   } catch (e) {
//     print('Firebase init error: $e');
//   }
// }

// flutter pub run build_runner build --delete-conflicting-outputs
