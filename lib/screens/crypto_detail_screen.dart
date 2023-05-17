import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return WillPopScope(
      onWillPop: () async {
        CryptoProvider pv = Provider.of<CryptoProvider>(context, listen: false);
        pv.whenPressPopScreen();

        return true;
      },
      child: Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Text("${provider.selectedCurrentPrice} to BTC", style: kTextStyleSubHeader),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: TextFormField(
                              controller: provider.searchTxtCtrl,
                              keyboardType: TextInputType.number,
                              validator: (str) {
                                if (str!.isEmpty) {
                                  return "Please input value";
                                }

                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                provider.calculateBTC();
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 24.0,
                              ),
                              label: const Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Card(
                      child: ListTile(
                        title: const Text("BTC", style: kTextStyleSubHeader,),
                        subtitle: Text("${provider.btc}", style: kTextStyleHeader,),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("History", style: kTextStyleSubHeader),
                    ),
                    Divider(color: Colors.grey[500]),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.currentPriceHistory.length,
                        itemBuilder: (context, int index) {
                          CurrentPrice item = provider.currentPriceHistory[index];

                          return ListTile(
                            title: Text(item.time.updated, style: kTextStyleDetail,),
                            subtitle: Text(provider.displayHistoryByCryptoCode(item.bpi), style: kTextStyleSubHeader,),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
          )
      ),
    );
  }
}
