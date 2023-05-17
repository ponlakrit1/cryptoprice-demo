import 'crypto.dart';

class CurrentPrice {
  late String time;
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
      time: json["time"] as String,
      disclaimer: json["disclaimer"] as String,
      chartName: json["chartName"] as String,
      bpi: json["bpi"] as Crypto,
    );
  }

  Map<String, dynamic> toJson() => {
    'time': time,
    'disclaimer': disclaimer,
    'chartName': chartName,
    'bpi': bpi,
  };
}
