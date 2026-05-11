import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/start',

  routes: [
    GoRoute(path: '/start', builder: (_, _) => Scaffold()),
    GoRoute(path: '/auth', builder: (_, _) => Scaffold()),
    GoRoute(path: '/main', builder: (_, _) => Scaffold()),
  ],
);
