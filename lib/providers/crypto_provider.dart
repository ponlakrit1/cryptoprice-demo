import 'package:cryptocurrency_demo/modals/current_price.dart';
import 'package:flutter/material.dart';

import '../services/crypto_service.dart';

class CryptoProvider with ChangeNotifier {

  final _service = CryptoService();

  late CurrentPrice currentPrice;

  Future<void> getCryptoCurrentPrice() async {
    currentPrice = await _service.findCryptoCurrentPrice();

    print(currentPrice.toJson());

    notifyListeners();
  }

}