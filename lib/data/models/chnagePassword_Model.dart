// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromMap(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromMap(String str) =>
    ChangePasswordModel.fromMap(json.decode(str));

String changePasswordModelToMap(ChangePasswordModel data) =>
    json.encode(data.toMap());

class ChangePasswordModel {
  final String? status;
  final String? message;

  ChangePasswordModel({
    this.status,
    this.message,
  });

  ChangePasswordModel copyWith({
    String? status,
    String? message,
  }) =>
      ChangePasswordModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory ChangePasswordModel.fromMap(Map<String, dynamic> json) =>
      ChangePasswordModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}
