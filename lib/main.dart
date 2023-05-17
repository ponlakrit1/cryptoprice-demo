import 'package:cryptocurrency_demo/providers/crypto_provider.dart';
import 'package:cryptocurrency_demo/routes.dart';
import 'package:cryptocurrency_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return CryptoProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme(context),
        initialRoute: RoutePaths.Crypto,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}