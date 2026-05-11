import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseUrl = dotenv.env['BASE_URL']!;
  static final String imageUrl = dotenv.env['IMAGE_URL']!;

  // auth
  static const String verifyOtp = '/auth/verify-otp/';
  static const String sendOtp = '/auth/send-otp/';
  static const String register = '/auth/register/';
  static const String logout = '/auth/logout/';
  static const String profile = '/profile/';

  // loyalty
  static const String loyalty = '/loyalty/';
  static const String loyaltyTiers = '/loyalty/tiers/';
  static const String loyaltyTransactions = '/loyalty/transactions/';

  // branches
  static const String branches = '/branches/';

  // news
  static const String news = '/news/';

  // menu
  static const String categories = '/menu/categories/';
  static const String products = '/menu/products/';

  // order
  static const String orders = '/orders/';
  static const String ordersLast = '/orders/last/';

  // payments
  static const String paymentsInitiate = '/payments/initiate/';
  static const String paymentsPoints = '/payments/points/';

  // fcm
  static String saveFCMToken = '$baseUrl/profile/';

  // notification
  static String notifications = '$baseUrl/notifications/';
}
