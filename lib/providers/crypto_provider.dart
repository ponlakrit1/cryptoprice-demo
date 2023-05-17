import 'dart:async';

import 'package:cryptocurrency_demo/models/current_price.dart';
import 'package:flutter/material.dart';

import '../models/crypto.dart';
import '../routes.dart';
import '../services/crypto_service.dart';

class CryptoProvider with ChangeNotifier {

  final _service = CryptoService();

  late TextEditingController searchTxtCtrl = TextEditingController();

  late bool busy = true;
  late String selectedCurrentPrice = "";
  late double btc = 0.0;

  late CurrentPrice currentPrice;
  late List<CurrentPrice> currentPriceHistory = [];

  Future<void> getCryptoCurrentPrice() async {
    currentPrice = await _service.findCryptoCurrentPrice();

    currentPriceHistory.insert(0, currentPrice);

    busy = false;
    notifyListeners();
  }

  displayHistoryByCryptoCode(Crypto item) {
    if (selectedCurrentPrice == 'USD') {
      return item.USD.rate;
    } else if (selectedCurrentPrice == 'EUR') {
      return item.EUR.rate;
    } else if (selectedCurrentPrice == 'GBP') {
      return item.GBP.rate;
    }
  }

  void gotoCryptoDetailScreen(BuildContext context, String cryptoCode) {
    selectedCurrentPrice = cryptoCode;

    Navigator.pushNamed(context, RoutePaths.CryptoDetail);
  }

  void calculateBTC() {
    double crrPrice = 0.0;

    if (selectedCurrentPrice == 'USD') {
      crrPrice = currentPrice.bpi.USD.rateFloat;
    } else if (selectedCurrentPrice == 'EUR') {
      crrPrice = currentPrice.bpi.EUR.rateFloat;
    } else if (selectedCurrentPrice == 'GBP') {
      crrPrice = currentPrice.bpi.GBP.rateFloat;
    }

    btc = double.parse(searchTxtCtrl.text) / crrPrice;

    notifyListeners();
  }

  void whenPressPopScreen() {
    searchTxtCtrl.text = "";
    btc = 0.0;

    notifyListeners();
  }

}