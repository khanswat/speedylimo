import 'dart:convert';

ChangePasswordModel changePasswordModelFromMap(String str) =>
    ChangePasswordModel.fromMap(json.decode(str));

String changePasswordModelToMap(ChangePasswordModel data) =>
    json.encode(data.toMap());

class ChangePasswordModel {
  ChangePasswordModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<dynamic>? data;

  ChangePasswordModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<dynamic>? data,
  }) =>
      ChangePasswordModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ChangePasswordModel.fromMap(Map<String, dynamic> json) =>
      ChangePasswordModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: List<dynamic>.from(json['data'].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x)),
      };
}
