import 'dart:convert';

import 'package:flutter_store_demo/core/network/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocalStorage {
  static LocalStorage? _instance;
  static LocalStorage get instance => _instance!;

  static const tokenKey = 'token';

  static const otpTokenKey = 'otp_token';

  factory LocalStorage() => instance;

  LocalStorage._();

  static Future<LocalStorage> init() async {
    assert(_instance == null);
    _instance = await SharedPrefLocalStorageImpl._().init();
    return _instance!;
  }

  void setInt(String key, int value);
  void setDouble(String key, double value);
  void setBool(String key, bool value);
  void setString(String key, String value);
  void setStringList(String key, List<String> value);
  void setObject(String key, Object? value);

  void remove(String key);

  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String>? getStringList(String key);
  dynamic getObject(String key);

  void addListener<T>(String key, Function(dynamic value) listener);
  void removeListener(String key);

  // Метод для очистки всех данных
  void clearAll();


  Token? get token {
    final map = getObject(tokenKey);
    return map != null ? Token.fromJson(map) : null;
  }

  set token(Token? token) => setObject(tokenKey, token?.toJson());

  // Геттер и сеттер для OTP токена
  String? get otpToken => getString(otpTokenKey);
  set otpToken(String? token) {
    if (token != null) {
      setString(otpTokenKey, token);
    } else {
      remove(otpTokenKey);
    }
  }

  bool get isUserAuthorized {
    final token = getString('token');
    final isGuest = getBool('isGuest') ?? false;
    final isRegistered = getBool('isRegistered') ?? false;

    // Пользователь авторизован, если есть токен И он не гость
    return token != null && token.isNotEmpty && !isGuest && isRegistered;
  }

  // Метод для очистки всех данных аутентификации
  void clearAuthData() {
    remove(tokenKey);
    remove(otpTokenKey);
  }
}

class SharedPrefLocalStorageImpl extends LocalStorage {
  SharedPreferences? _preferences;
  Map<String, Function(dynamic value)> listeners = {};

  SharedPrefLocalStorageImpl._() : super._();

  Future<SharedPrefLocalStorageImpl> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  @override
  void setInt(String key, int value) {
    _preferences?.setInt(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setDouble(String key, double value) {
    _preferences?.setDouble(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setBool(String key, bool value) {
    _preferences?.setBool(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setString(String key, String value) {
    _preferences?.setString(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setStringList(String key, List<String> value) {
    _preferences?.setStringList(key, value);
    listeners[key]?.call(value);
  }

  @override
  void setObject(String key, Object? value) {
    _preferences?.setString(key, jsonEncode(value));
    listeners[key]?.call(value);
  }

  @override
  void remove(String key) {
    _preferences?.remove(key);
    listeners[key]?.call(null);
  }

  @override
  bool? getBool(String key) => _preferences?.getBool(key);

  @override
  int? getInt(String key) => _preferences?.getInt(key);

  @override
  double? getDouble(String key) => _preferences?.getDouble(key);

  @override
  String? getString(String key) => _preferences?.getString(key);

  @override
  List<String>? getStringList(String key) => _preferences?.getStringList(key);

  @override
  dynamic getObject(String key) {
    final value = _preferences?.getString(key);
    if (value != null) return jsonDecode(value);
    return null;
  }

  @override
  void addListener<T>(String key, Function(dynamic value) listener) {
    listeners[key] = listener;
  }

  @override
  void removeListener(String key) => listeners.remove(key);

  @override
  void clearAll() {
    _preferences?.clear();
    for (final listener in listeners.values) {
      listener(null);
    }
  }
}