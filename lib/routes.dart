import 'package:cryptocurrency_demo/screens/crypto_detail_screen.dart';
import 'package:cryptocurrency_demo/screens/fibonacci_screen.dart';
import 'package:cryptocurrency_demo/screens/prime_number_screen.dart';
import 'package:flutter/material.dart';

import 'package:cryptocurrency_demo/screens/crypto_screen.dart';

class RoutePaths {
  static const String Crypto = 'crypto';
  static const String CryptoDetail = 'crypto_detail';
  static const String PrimeNumber = 'prime_number';
  static const String Fibonacci = 'fibonacci';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Crypto:
        return MaterialPageRoute(builder: (_) => const CryptoScreen());
      case RoutePaths.CryptoDetail:
        return MaterialPageRoute(builder: (_) => const CryptoDetailScreen());
      case RoutePaths.PrimeNumber:
        return MaterialPageRoute(builder: (_) => const PrimeNumberScreen());
      case RoutePaths.Fibonacci:
        return MaterialPageRoute(builder: (_) => const FibonacciScreen());
      default:
        return  MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}