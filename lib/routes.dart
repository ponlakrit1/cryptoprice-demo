import 'package:cryptocurrency_demo/screens/crypto_detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:cryptocurrency_demo/screens/crypto_screen.dart';

class RoutePaths {
  static const String Crypto = 'crypto';
  static const String CryptoDetail = 'crypto_detail';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Crypto:
        return MaterialPageRoute(builder: (_) => const CryptoScreen());
      case RoutePaths.CryptoDetail:
        return MaterialPageRoute(builder: (_) => const CryptoDetailScreen());
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