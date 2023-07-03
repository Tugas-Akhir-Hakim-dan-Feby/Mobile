
class Payment {
  String? status;
  String? message;
  int? statusCode;
  List<Data> data;

  Payment({
    this.status,
    this.message,
    this.statusCode,
    required this.data,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      status: json['status'],
      message: json['message'],
      statusCode: json['status_code'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  String? uuid;
  String? externalId;
  String? status;
  String? amount;
  String? paymentLink;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data({
    this.uuid,
    this.externalId,
    this.status,
    this.amount,
    this.paymentLink,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      uuid: json['uuid'],
      externalId: json['external_id'],
      status: json['status'],
      amount: json['amount'],
      paymentLink: json['payment_link'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
