import 'dart:async';

import 'package:cryptocurrency_demo/models/current_price.dart';
import 'package:flutter/material.dart';

import '../services/crypto_service.dart';

class CryptoProvider with ChangeNotifier {

  final _service = CryptoService();

  late bool busy = true;

  late CurrentPrice currentPrice;
  late List<CurrentPrice> currentPriceHistory = [];

  Future<void> getCryptoCurrentPrice() async {
    currentPrice = await _service.findCryptoCurrentPrice();

    currentPriceHistory.insert(0, currentPrice);

    busy = false;
    notifyListeners();
  }

}