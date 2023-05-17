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
      USD: CryptoDetail.fromJson(json["USD"]),
      GBP: CryptoDetail.fromJson(json["GBP"]),
      EUR: CryptoDetail.fromJson(json["EUR"]),
    );
  }

  Map<String, dynamic> toJson() => {
    'USD': USD.toJson(),
    'GBP': GBP.toJson(),
    'EUR': EUR.toJson(),
  };
}
