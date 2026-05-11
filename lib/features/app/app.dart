import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_store_demo/core/network/local_storage/local_storage.dart';
import 'package:flutter_store_demo/core/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // 👇 ADD THE SUPPORTED LOCALES
        supportedLocales: const [Locale('ru', 'RU')],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
  }

  void _checkAuth() {
    final storage = LocalStorage();
    final token = storage.getString('token');
    final isRegistered = storage.getBool('isRegistered');
    final isGuest = storage.getBool('isGuest');
    if ((token != null && token.isNotEmpty && isRegistered == true) ||
        isGuest == true) {
      router.go('/main');
    } else {
      router.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
    );
  }
}
