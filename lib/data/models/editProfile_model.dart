// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'dart:convert';

ProfileModel profileModelFromMap(String str) =>
    ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  final bool? success;
  final String? message;

  ProfileModel({
    this.success,
    this.message,
  });

  ProfileModel copyWith({
    bool? success,
    String? message,
  }) =>
      ProfileModel(
        success: success ?? this.success,
        message: message ?? this.message,
      );

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        success: json['success'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
      };
}
