class CryptoDetail {
  late String code;
  late String symbol;
  late String rate;
  late String description;
  late double rateFloat;

  CryptoDetail({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory CryptoDetail.fromJson(Map<String, dynamic> json) {
    return CryptoDetail(
      code: json["code"] as String,
      symbol: json["symbol"] as String,
      rate: json["rate"] as String,
      description: json["description"] as String,
      rateFloat: json["rate_float"] as double,
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'symbol': symbol,
    'rate': rate,
    'description': description,
    'rate_float': rateFloat,
  };
}
