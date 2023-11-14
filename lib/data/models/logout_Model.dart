// To parse this JSON data, do
//
//     final logoutModel = logoutModelFromMap(jsonString);

import 'dart:convert';

LogoutModel logoutModelFromMap(String str) =>
    LogoutModel.fromMap(json.decode(str));

String logoutModelToMap(LogoutModel data) => json.encode(data.toMap());

class LogoutModel {
  LogoutModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<dynamic>? data;

  LogoutModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<dynamic>? data,
  }) =>
      LogoutModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LogoutModel.fromMap(Map<String, dynamic> json) => LogoutModel(
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
