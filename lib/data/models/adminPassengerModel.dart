import 'dart:convert';

AdminPassengerModel AdminPassengerModelFromMap(String str) =>
    AdminPassengerModel.fromMap(json.decode(str));

String AdminPassengerModelToMap(AdminPassengerModel data) =>
    json.encode(data.toMap());

class AdminPassengerModel {
  final List<AdminPassengerData>? data;
  final String? message;

  AdminPassengerModel({
    this.data,
    this.message,
  });

  AdminPassengerModel copyWith({
    List<AdminPassengerData>? data,
    String? message,
  }) =>
      AdminPassengerModel(
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AdminPassengerModel.fromMap(Map<String, dynamic> json) =>
      AdminPassengerModel(
        data: json['data'] == null
            ? []
            : List<AdminPassengerData>.from(
                json['data']!.map((x) => AdminPassengerData.fromMap(x))),
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'data':
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        'message': message,
      };
}

class AdminPassengerData {
  final int? id;
  final int? status;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdminPassengerData({
    this.id,
    this.status,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  AdminPassengerData copyWith({
    int? id,
    int? status,
    String? name,
    String? email,
    String? phoneNumber,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AdminPassengerData(
        id: id ?? this.id,
        status: status ?? this.status,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AdminPassengerData.fromMap(Map<String, dynamic> json) =>
      AdminPassengerData(
        id: json['id'],
        status: json['status'],
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
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'status': status,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
