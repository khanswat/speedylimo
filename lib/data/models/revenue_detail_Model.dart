import 'dart:convert';

OpDetailModel opDetailModelFromMap(String? str) =>
    OpDetailModel.fromMap(json.decode(str!));

String? opDetailModelToMap(OpDetailModel data) => json.encode(data.toMap());

class OpDetailModel {
  OpDetailModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<OpDetaildata>? data;

  OpDetailModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<OpDetaildata>? data,
  }) =>
      OpDetailModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory OpDetailModel.fromMap(Map<String, dynamic> json) => OpDetailModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: List<OpDetaildata>.from(
            json['data'].map((x) => OpDetaildata.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class OpDetaildata {
  OpDetaildata({
    this.serviceType,
    this.op,
    this.ip,
  });

  final String? serviceType;
  final dynamic op;
  final dynamic ip;

  OpDetaildata copyWith({
    String? serviceType,
    dynamic op,
    dynamic ip,
  }) =>
      OpDetaildata(
        serviceType: serviceType ?? this.serviceType,
        op: op ?? this.op,
        ip: ip ?? this.ip,
      );

  factory OpDetaildata.fromMap(Map<String, dynamic> json) => OpDetaildata(
        serviceType: json['service_type'],
        op: json['op'],
        ip: json['ip'],
      );

  Map<String, dynamic> toMap() => {
        'service_type': serviceType,
        'op': op,
        'ip': ip,
      };
}
