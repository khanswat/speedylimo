import 'dart:convert';

DeleteModel deleteModelFromMap(String str) =>
    DeleteModel.fromMap(json.decode(str));

String deleteModelToMap(DeleteModel data) => json.encode(data.toMap());

class DeleteModel {
  final String? status;
  final String? message;

  DeleteModel({
    this.status,
    this.message,
  });

  DeleteModel copyWith({
    String? status,
    String? message,
  }) =>
      DeleteModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory DeleteModel.fromMap(Map<String, dynamic> json) => DeleteModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}
