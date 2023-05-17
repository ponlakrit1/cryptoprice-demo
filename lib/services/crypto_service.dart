import 'dart:convert';

import 'package:cryptocurrency_demo/modals/current_price.dart';
import 'package:dio/dio.dart';

import '../utils/global.dart';

class CryptoService {

  Future<CurrentPrice> findCryptoCurrentPrice() async {
    final response = await Dio().get(Global.cryptoRootURL);
    if (response.statusCode == 200) {
      return CurrentPrice.fromJson(json.decode(response.data!));
    } else {
      throw Exception('Failed to load resource');
    }
  }

}