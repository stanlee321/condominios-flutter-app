class ActivityModel {
  int id;
  String? deliverFrom;
  String? code;
  String? expirationDate;
  String? remainingUses;
  String? serviceType;
  bool? validated;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  ActivityModel({
    required this.id,
    this.deliverFrom,
    this.code,
    this.expirationDate,
    this.remainingUses,
    this.serviceType,
    this.validated,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json['id'],
        deliverFrom: json['deliver_from'],
        code: json['code'],
        expirationDate: json['expiration_date'],
        remainingUses: json['remaining_uses'],
        serviceType: json['service_type'],
        validated: json['validated'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        deletedAt: json['deleted_at'] == null
            ? null
            : DateTime.parse(json['deleted_at']),
      );
}
