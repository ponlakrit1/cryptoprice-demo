import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/crypto_provider.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CryptoProvider>(context, listen: false).getCryptoCurrentPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Crypto'),
            ),
        ),
        body: Consumer(
          builder: (BuildContext context, CryptoProvider provider, child) {
            return Container();
          }
        )
    );
  }
}
