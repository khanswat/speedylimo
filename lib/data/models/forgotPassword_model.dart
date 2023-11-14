import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromMap(String str) =>
    ForgotPasswordModel.fromMap(json.decode(str));

String forgotPasswordModelToMap(ForgotPasswordModel data) =>
    json.encode(data.toMap());

class ForgotPasswordModel {
  ForgotPasswordModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<dynamic>? data;

  ForgotPasswordModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<dynamic>? data,
  }) =>
      ForgotPasswordModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ForgotPasswordModel.fromMap(Map<String, dynamic> json) =>
      ForgotPasswordModel(
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
