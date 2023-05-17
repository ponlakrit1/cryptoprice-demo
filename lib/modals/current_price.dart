import 'dart:convert';

import 'package:cryptocurrency_demo/modals/update_time.dart';

import 'crypto.dart';

class CurrentPrice {
  late UpdateTime time;
  late String disclaimer;
  late String chartName;
  late Crypto bpi;

  CurrentPrice({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      time: UpdateTime.fromJson(json["time"]),
      disclaimer: json["disclaimer"] as String,
      chartName: json["chartName"] as String,
      bpi: Crypto.fromJson(json["bpi"]),
    );
  }

  Map<String, dynamic> toJson() => {
    'time': time.toJson(),
    'disclaimer': disclaimer,
    'chartName': chartName,
    'bpi': bpi.toJson(),
  };
}
