import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final Data? data;

  UserModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    Data? data,
  }) =>
      UserModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );
  static const empty = UserModel();

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: json['data'] == null ? null : Data?.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data?.toMap(),
      };

  UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

  String userModelToMap(UserModel data) => json.encode(data.toMap());

  @override
  List<Object?> get props => [
        status,
        statusCode,
        message,
        data,
      ];
}

class Data extends Equatable {
  Data({
    this.userData,
    this.accessToken,
    this.ttl,
    this.createdAt,
  });

  final UserData? userData;
  final String? accessToken;
  final String? ttl;
  final int? createdAt;

  Data copyWith({
    UserData? userData,
    String? accessToken,
    String? ttl,
    int? createdAt,
  }) =>
      Data(
        userData: userData ?? this.userData,
        accessToken: accessToken ?? this.accessToken,
        ttl: ttl ?? this.ttl,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userData: UserData.fromMap(json['userData']),
        accessToken: json['accessToken'],
        ttl: json['ttl'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toMap() => {
        'userData': userData!.toMap(),
        'accessToken': accessToken,
        'ttl': ttl,
        'createdAt': createdAt,
      };

  @override
  List<Object?> get props => [userData, accessToken, ttl, createdAt];
}

class UserData extends Equatable {
  UserData({
    this.userId,
    this.userName,
    this.userDisplayName,
  });

  final int? userId;
  final String? userName;
  final String? userDisplayName;

  UserData copyWith({
    int? userId,
    String? userName,
    String? userDisplayName,
  }) =>
      UserData(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        userDisplayName: userDisplayName ?? this.userDisplayName,
      );

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        userId: json['user_id'],
        userName: json['user_name'],
        userDisplayName: json['user_display_name'],
      );

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'user_name': userName,
        'user_display_name': userDisplayName,
      };

  @override
  List<Object?> get props => [userDisplayName, userDisplayName, userId];
}
