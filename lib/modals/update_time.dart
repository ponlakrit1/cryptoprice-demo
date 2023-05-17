class UpdateTime {
  late String updated;
  late String updatedISO;
  late String updateduk;

  UpdateTime({
    required this.updated,
    required this.updatedISO,
    required this.updateduk,
  });

  factory UpdateTime.fromJson(Map<String, dynamic> json) {
    return UpdateTime(
      updated: json["updated"] as String,
      updatedISO: json["updatedISO"] as String,
      updateduk: json["updateduk"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'updated': updated,
    'updatedISO': updatedISO,
    'updateduk': updateduk,
  };
}
