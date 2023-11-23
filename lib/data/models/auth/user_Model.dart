// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  final int? status;
  final UserData? data;
  final String? message;

  UserModel({
    this.status,
    this.data,
    this.message,
  });

  UserModel copyWith({
    int? status,
    UserData? data,
    String? message,
  }) =>
      UserModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        status: json['status'],
        data: json['data'] == null ? null : UserData.fromMap(json['data']),
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.toMap(),
        'message': message,
      };
}

class UserData {
  final User? user;
  final String? token;

  UserData({
    this.user,
    this.token,
  });

  UserData copyWith({
    User? user,
    String? token,
  }) =>
      UserData(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        user: json['user'] == null ? null : User.fromMap(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'token': token,
      };
}

class User {
  final int? id;
  final int? status;
  final dynamic userType;
  final String? name;
  final String? email;
  final dynamic phoneNumber;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Role>? roles;

  User({
    this.id,
    this.status,
    this.userType,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  User copyWith({
    int? id,
    int? status,
    dynamic userType,
    String? name,
    String? email,
    dynamic phoneNumber,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Role>? roles,
  }) =>
      User(
        id: id ?? this.id,
        status: status ?? this.status,
        userType: userType ?? this.userType,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        roles: roles ?? this.roles,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        status: json['status'],
        userType: json['user_type'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        image: json['image'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        roles: json['roles'] == null
            ? []
            : List<Role>.from(json['roles']!.map((x) => Role.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'status': status,
        'user_type': userType,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'roles': roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toMap())),
      };
}

class Role {
  final int? id;
  final String? name;
  final String? guardName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Role copyWith({
    int? id,
    String? name,
    String? guardName,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        guardName: guardName ?? this.guardName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json['id'],
        name: json['name'],
        guardName: json['guard_name'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        pivot: json['pivot'] == null ? null : Pivot.fromMap(json['pivot']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'guard_name': guardName,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'pivot': pivot?.toMap(),
      };
}

class Pivot {
  final int? modelId;
  final int? roleId;
  final String? modelType;

  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  Pivot copyWith({
    int? modelId,
    int? roleId,
    String? modelType,
  }) =>
      Pivot(
        modelId: modelId ?? this.modelId,
        roleId: roleId ?? this.roleId,
        modelType: modelType ?? this.modelType,
      );

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        modelId: json['model_id'],
        roleId: json['role_id'],
        modelType: json['model_type'],
      );

  Map<String, dynamic> toMap() => {
        'model_id': modelId,
        'role_id': roleId,
        'model_type': modelType,
      };
}
