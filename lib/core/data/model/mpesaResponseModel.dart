class MpesaResponseModel {
  bool? status;
  List<Data>? data;

  MpesaResponseModel({this.status, this.data});

  MpesaResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? amount;
  String? receiptCode;
  String? date;
  Null? reference;
  String? email;
  Null? type;
  String? chargeId;
  String? callbackId;
  String? channel;
  String? status;
  String? statusCode;
  String? phoneNumber;
  String? created;

  Data(
      {this.id,
      this.amount,
      this.receiptCode,
      this.date,
      this.reference,
      this.email,
      this.type,
      this.chargeId,
      this.callbackId,
      this.channel,
      this.status,
      this.statusCode,
      this.phoneNumber,
      this.created});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    receiptCode = json['receipt_code'];
    date = json['date'];
    reference = json['reference'];
    email = json['email'];
    type = json['type'];
    chargeId = json['charge_id'];
    callbackId = json['callback_id'];
    channel = json['channel'];
    status = json['status'];
    statusCode = json['status_code'];
    phoneNumber = json['phone_number'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['receipt_code'] = this.receiptCode;
    data['date'] = this.date;
    data['reference'] = this.reference;
    data['email'] = this.email;
    data['type'] = this.type;
    data['charge_id'] = this.chargeId;
    data['callback_id'] = this.callbackId;
    data['channel'] = this.channel;
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['phone_number'] = this.phoneNumber;
    data['created'] = this.created;
    return data;
  }
}
