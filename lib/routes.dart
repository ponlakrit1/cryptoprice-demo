import 'package:flutter/material.dart';

import 'package:cryptocurrency_demo/screens/crypto_screen.dart';

class RoutePaths {
  static const String Crypto = 'crypto';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Crypto:
        return MaterialPageRoute(builder: (_) => const CryptoScreen());
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