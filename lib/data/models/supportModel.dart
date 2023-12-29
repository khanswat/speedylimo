// To parse this JSON data, do
//
//     final supportModel = supportModelFromMap(jsonString);

import 'dart:convert';

SupportModel supportModelFromMap(String str) =>
    SupportModel.fromMap(json.decode(str));

String supportModelToMap(SupportModel data) => json.encode(data.toMap());

class SupportModel {
  final int? status;
  final String? message;

  SupportModel({
    this.status,
    this.message,
  });

  SupportModel copyWith({
    int? status,
    String? message,
  }) =>
      SupportModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory SupportModel.fromMap(Map<String, dynamic> json) => SupportModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}
