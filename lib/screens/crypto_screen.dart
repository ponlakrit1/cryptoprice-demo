import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_price.dart';
import '../providers/crypto_provider.dart';
import '../utils/style.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {

  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CryptoProvider pv = Provider.of<CryptoProvider>(context, listen: false);

      pv.getCryptoCurrentPrice();

      timer = Timer.periodic(const Duration(minutes: 1), (Timer t) async {
        pv.getCryptoCurrentPrice();
      });
    });
  }

  @override
  dispose() {
    timer!.cancel();

    super.dispose();
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
            return provider.busy ? const Text("Loading ...") : ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(IconData(0xf04df, fontFamily: 'MaterialIcons')),
                    title: Text(provider.currentPrice.bpi.USD.code, style: kTextStyleSubHeader,),
                    subtitle: Text(provider.currentPrice.bpi.USD.rate, style: kTextStyleHeader,),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(IconData(0xf04df, fontFamily: 'MaterialIcons')),
                    title: Text(provider.currentPrice.bpi.EUR.code, style: kTextStyleSubHeader,),
                    subtitle: Text(provider.currentPrice.bpi.EUR.rate, style: kTextStyleHeader,),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(IconData(0xe23b, fontFamily: 'MaterialIcons')),
                    title: Text(provider.currentPrice.bpi.GBP.code, style: kTextStyleSubHeader,),
                    subtitle: Text(provider.currentPrice.bpi.GBP.rate, style: kTextStyleHeader,),
                  ),
                ),
              ],
            );
          }
        )
    );
  }
}
