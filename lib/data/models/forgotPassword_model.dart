// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromMap(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromMap(String str) =>
    ForgotPasswordModel.fromMap(json.decode(str));

String forgotPasswordModelToMap(ForgotPasswordModel data) =>
    json.encode(data.toMap());

class ForgotPasswordModel {
  final String? status;
  final String? message;

  ForgotPasswordModel({
    this.status,
    this.message,
  });

  ForgotPasswordModel copyWith({
    String? status,
    String? message,
  }) =>
      ForgotPasswordModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory ForgotPasswordModel.fromMap(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}
