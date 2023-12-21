import 'dart:convert';

AdminDriverModel AdminDriverModelFromMap(String str) =>
    AdminDriverModel.fromMap(json.decode(str));

String AdminDriverModelToMap(AdminDriverModel data) =>
    json.encode(data.toMap());

class AdminDriverModel {
  final List<AdminDriverData>? data;
  final String? baseUrl;
  final String? message;

  AdminDriverModel({
    this.data,
    this.baseUrl,
    this.message,
  });

  AdminDriverModel copyWith({
    List<AdminDriverData>? data,
    String? baseUrl,
    String? message,
  }) =>
      AdminDriverModel(
        data: data ?? this.data,
        baseUrl: baseUrl ?? this.baseUrl,
        message: message ?? this.message,
      );

  factory AdminDriverModel.fromMap(Map<String, dynamic> json) =>
      AdminDriverModel(
        data: json['data'] == null
            ? []
            : List<AdminDriverData>.from(
                json['data']!.map((x) => AdminDriverData.fromMap(x))),
        baseUrl: json['base_url'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'data':
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        'base_url': baseUrl,
        'message': message,
      };
}

class AdminDriverData {
  final int? id;
  final int? status;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DriverDocs? driverDocs;

  AdminDriverData({
    this.id,
    this.status,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.driverDocs,
  });

  AdminDriverData copyWith({
    int? id,
    int? status,
    String? name,
    String? email,
    String? phoneNumber,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
    DriverDocs? driverDocs,
  }) =>
      AdminDriverData(
        id: id ?? this.id,
        status: status ?? this.status,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        driverDocs: driverDocs ?? this.driverDocs,
      );

  factory AdminDriverData.fromMap(Map<String, dynamic> json) => AdminDriverData(
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
        driverDocs: json['driver_docs'] == null
            ? null
            : DriverDocs.fromMap(json['driver_docs']),
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
        'driver_docs': driverDocs?.toMap(),
      };
}

class DriverDocs {
  final int? id;
  final String? cnicFront;
  final String? cnicBack;
  final String? drivingLicense;
  final String? vehicleRegBook;
  final String? partnerPhoto;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DriverDocs({
    this.id,
    this.cnicFront,
    this.cnicBack,
    this.drivingLicense,
    this.vehicleRegBook,
    this.partnerPhoto,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  DriverDocs copyWith({
    int? id,
    String? cnicFront,
    String? cnicBack,
    String? drivingLicense,
    String? vehicleRegBook,
    String? partnerPhoto,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DriverDocs(
        id: id ?? this.id,
        cnicFront: cnicFront ?? this.cnicFront,
        cnicBack: cnicBack ?? this.cnicBack,
        drivingLicense: drivingLicense ?? this.drivingLicense,
        vehicleRegBook: vehicleRegBook ?? this.vehicleRegBook,
        partnerPhoto: partnerPhoto ?? this.partnerPhoto,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DriverDocs.fromMap(Map<String, dynamic> json) => DriverDocs(
        id: json['id'],
        cnicFront: json['cnic_front'],
        cnicBack: json['cnic_back'],
        drivingLicense: json['driving_license'],
        vehicleRegBook: json['vehicle_reg_book'],
        partnerPhoto: json['partner_photo'],
        userId: json['user_id'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cnic_front': cnicFront,
        'cnic_back': cnicBack,
        'driving_license': drivingLicense,
        'vehicle_reg_book': vehicleRegBook,
        'partner_photo': partnerPhoto,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
