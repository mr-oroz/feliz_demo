import 'package:flutter/material.dart';
import 'package:flutter_store_demo/features/home/presentation/screens/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(path: '/start', builder: (_, _) => Scaffold()),
    GoRoute(path: '/auth', builder: (_, _) => Scaffold()),
    GoRoute(path: '/main', builder: (_, _) => HomeScreen()),
  ],
);
