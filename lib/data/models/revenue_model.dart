import 'dart:convert';

RevenueModel revenueModelFromMap(String? str) =>
    RevenueModel.fromMap(json.decode(str!));

String? revenueModelToMap(RevenueModel data) => json.encode(data.toMap());

class RevenueModel {
  RevenueModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final RevenueData? data;

  RevenueModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    RevenueData? revenueData,
  }) =>
      RevenueModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RevenueModel.fromMap(Map<String, dynamic> json) => RevenueModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: RevenueData.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data!.toMap(),
      };
}

class RevenueData {
  RevenueData({
    this.records,
    this.month,
  });

  final List<Record>? records;
  final String? month;

  RevenueDatacopyWith({
    List<Record>? records,
    String? month,
  }) =>
      RevenueDatacopyWith(
        records: records ?? this.records,
        month: month ?? this.month,
      );

  factory RevenueData.fromMap(Map<String, dynamic> json) => RevenueData(
        records:
            List<Record>.from(json['records'].map((x) => Record.fromMap(x))),
        month: json['month'],
      );

  Map<String, dynamic> toMap() => {
        'records': List<dynamic>.from(records!.map((x) => x.toMap())),
        'month': month,
      };
}

class Record {
  Record({
    this.transMonth,
    this.transDay,
    this.opRevenue,
    this.ipRevenue,
    this.totalRevenue,
  });

  final String? transMonth;
  final dynamic transDay;
  final dynamic opRevenue;
  final dynamic ipRevenue;
  final dynamic totalRevenue;

  Record copyWith({
    String? transMonth,
    dynamic transDay,
    dynamic opRevenue,
    dynamic ipRevenue,
    dynamic totalRevenue,
  }) =>
      Record(
        transMonth: transMonth ?? this.transMonth,
        transDay: transDay ?? this.transDay,
        opRevenue: opRevenue ?? this.opRevenue,
        ipRevenue: ipRevenue ?? this.ipRevenue,
        totalRevenue: totalRevenue ?? this.totalRevenue,
      );

  factory Record.fromMap(Map<String, dynamic> json) => Record(
        transMonth: json['trans_month'],
        transDay: json['trans_day'],
        opRevenue: json['op_revenue'].toDouble(),
        ipRevenue: json['ip_revenue'],
        totalRevenue: json['total_revenue'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'trans_month': transMonth,
        'trans_day': transDay,
        'op_revenue': opRevenue,
        'ip_revenue': ipRevenue,
        'total_revenue': totalRevenue,
      };
}
