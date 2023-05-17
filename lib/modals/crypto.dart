import 'crypto_detail.dart';

class Crypto {
  late CryptoDetail USD;
  late CryptoDetail GBP;
  late CryptoDetail EUR;

  Crypto({
    required this.USD,
    required this.GBP,
    required this.EUR,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      USD: json["USD"] as CryptoDetail,
      GBP: json["GBP"] as CryptoDetail,
      EUR: json["EUR"] as CryptoDetail,
    );
  }

  Map<String, dynamic> toJson() => {
    'USD': USD,
    'GBP': GBP,
    'EUR': EUR,
  };
}
