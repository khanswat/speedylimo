import 'dart:convert';

BokingQueriesModel bokingQueriesModelFromMap(String str) =>
    BokingQueriesModel.fromMap(json.decode(str));

String bokingQueriesModelToMap(BokingQueriesModel data) =>
    json.encode(data.toMap());

class BokingQueriesModel {
  final int? status;
  final List<BookingQueryData>? data;
  final String? baseUrl;
  final String? message;

  BokingQueriesModel({
    this.status,
    this.data,
    this.baseUrl,
    this.message,
  });

  BokingQueriesModel copyWith({
    int? status,
    List<BookingQueryData>? data,
    String? baseUrl,
    String? message,
  }) =>
      BokingQueriesModel(
        status: status ?? this.status,
        data: data ?? this.data,
        baseUrl: baseUrl ?? this.baseUrl,
        message: message ?? this.message,
      );

  factory BokingQueriesModel.fromMap(Map<String, dynamic> json) =>
      BokingQueriesModel(
        status: json['status'],
        data: json['data'] == null
            ? []
            : List<BookingQueryData>.from(
                json['data']!.map((x) => BookingQueryData.fromMap(x))),
        baseUrl: json['base_url'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data':
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        'base_url': baseUrl,
        'message': message,
      };
}

class BookingQueryData {
  final int? id;
  final String? technology;
  final String? serviceRequest;
  final String? email;
  final String? contact;
  final String? firstName;
  final String? lastName;
  final String? phoneNo;
  final String? contactMethod;
  final String? companyName;
  final String? summary;
  final String? requestDetail;
  final String? file;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BookingQueryData({
    this.id,
    this.technology,
    this.serviceRequest,
    this.email,
    this.contact,
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.contactMethod,
    this.companyName,
    this.summary,
    this.requestDetail,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  BookingQueryData copyWith({
    int? id,
    String? technology,
    String? serviceRequest,
    String? email,
    String? contact,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? contactMethod,
    String? companyName,
    String? summary,
    String? requestDetail,
    String? file,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      BookingQueryData(
        id: id ?? this.id,
        technology: technology ?? this.technology,
        serviceRequest: serviceRequest ?? this.serviceRequest,
        email: email ?? this.email,
        contact: contact ?? this.contact,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNo: phoneNo ?? this.phoneNo,
        contactMethod: contactMethod ?? this.contactMethod,
        companyName: companyName ?? this.companyName,
        summary: summary ?? this.summary,
        requestDetail: requestDetail ?? this.requestDetail,
        file: file ?? this.file,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory BookingQueryData.fromMap(Map<String, dynamic> json) =>
      BookingQueryData(
        id: json['id'],
        technology: json['technology'],
        serviceRequest: json['service_request'],
        email: json['email'],
        contact: json['contact'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNo: json['phone_no'],
        contactMethod: json['contact_method'],
        companyName: json['company_name'],
        summary: json['summary'],
        requestDetail: json['request_detail'],
        file: json['file'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'technology': technology,
        'service_request': serviceRequest,
        'email': email,
        'contact': contact,
        'first_name': firstName,
        'last_name': lastName,
        'phone_no': phoneNo,
        'contact_method': contactMethod,
        'company_name': companyName,
        'summary': summary,
        'request_detail': requestDetail,
        'file': file,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
