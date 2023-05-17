import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_price.dart';
import '../providers/crypto_provider.dart';
import '../utils/style.dart';

class CryptoDetailScreen extends StatefulWidget {
  const CryptoDetailScreen({Key? key}) : super(key: key);

  @override
  _CryptoDetailScreenState createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
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
            return provider.busy ? const Text("Loading ...") : Column(
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(IconData(0xf04df, fontFamily: 'MaterialIcons')),
                    title: Text(provider.currentPrice.bpi.EUR.code, style: kTextStyleSubHeader,),
                    subtitle: Text(provider.currentPrice.bpi.EUR.rate, style: kTextStyleHeader,),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("History", style: kTextStyleSubHeader),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.currentPriceHistory.length,
                    itemBuilder: (context, int index) {
                      CurrentPrice item = provider.currentPriceHistory[index];

                      return ListTile(
                        title: Text(item.time.updated, style: kTextStyleDetail,),
                        subtitle: Text(item.bpi.EUR.rate, style: kTextStyleSubHeader,),
                      );
                    },
                  ),
                )
              ],
            );
          }
        )
    );
  }
}
