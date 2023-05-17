import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_price.dart';
import '../providers/crypto_provider.dart';
import '../routes.dart';
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
            backgroundColor: kPrimaryColor,
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('DEMO'),
            ),
        ),
        body: Consumer(
          builder: (BuildContext context, CryptoProvider provider, child) {
            return provider.busy ? const Text("Loading ...") : ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: const Icon(IconData(0xe0b2, fontFamily: 'MaterialIcons'), size: 30.0, color: Colors.white,),
                    ),
                    title: Text(provider.currentPrice.bpi.USD.code, style: kTextStyleSubHeaderPrimary,),
                    subtitle: Text(provider.currentPrice.bpi.USD.rate, style: kTextStyleHeader,),
                    trailing: const Icon(Icons.arrow_forward_ios, color: kSecondaryColor,),
                    onTap: () {
                      provider.gotoCryptoDetailScreen(context, "USD");
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: const Icon(IconData(0xf04df, fontFamily: 'MaterialIcons'), size: 30.0, color: Colors.white,),
                    ),
                    title: Text(provider.currentPrice.bpi.EUR.code, style: kTextStyleSubHeaderPrimary,),
                    subtitle: Text(provider.currentPrice.bpi.EUR.rate, style: kTextStyleHeader,),
                    trailing: const Icon(Icons.arrow_forward_ios, color: kSecondaryColor,),
                    onTap: () {
                      provider.gotoCryptoDetailScreen(context, "EUR");
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: const Icon(IconData(0xe23b, fontFamily: 'MaterialIcons'), size: 30.0, color: Colors.white,),
                    ),
                    title: Text(provider.currentPrice.bpi.GBP.code, style: kTextStyleSubHeaderPrimary,),
                    subtitle: Text(provider.currentPrice.bpi.GBP.rate, style: kTextStyleHeader,),
                    trailing: const Icon(Icons.arrow_forward_ios, color: kSecondaryColor,),
                    onTap: () {
                      provider.gotoCryptoDetailScreen(context, "GBP");
                    },
                  ),
                ),
              ],
            );
          }
        )
    );
  }
}
