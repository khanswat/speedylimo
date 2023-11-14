import 'dart:convert';

BudgetModel budgetModelFromMap(String str) =>
    BudgetModel.fromMap(json.decode(str));

String budgetModelToMap(BudgetModel data) => json.encode(data.toMap());

class BudgetModel {
  BudgetModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final BudgetData? data;

  BudgetModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    BudgetData? data,
  }) =>
      BudgetModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BudgetModel.fromMap(Map<String, dynamic> json) => BudgetModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: BudgetData.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data!.toMap(),
      };
}

class BudgetData {
  BudgetData({
    this.records,
    this.month,
  });

  final List<RecordData>? records;
  final String? month;

  BudgetData copyWith({
    List<RecordData>? records,
    String? month,
  }) =>
      BudgetData(
        records: records ?? this.records,
        month: month ?? this.month,
      );

  factory BudgetData.fromMap(Map<String, dynamic> json) => BudgetData(
        records: List<RecordData>.from(
            json['records'].map((x) => RecordData.fromMap(x))),
        month: json['month'],
      );

  Map<String, dynamic> toMap() => {
        'records': List<dynamic>.from(records!.map((x) => x.toMap())),
        'month': month,
      };
}

class RecordData {
  RecordData({
    this.transDay,
    this.revenue,
    this.budget,
    this.incDec,
    this.incdecAge,
  });

  final int? transDay;
  final dynamic revenue;
  final dynamic budget;
  final dynamic incDec;
  final dynamic incdecAge;

  RecordData copyWith({
    int? transDay,
    dynamic revenue,
    dynamic budget,
    dynamic incDec,
    dynamic incdecAge,
  }) =>
      RecordData(
        transDay: transDay ?? this.transDay,
        revenue: revenue ?? this.revenue,
        budget: budget ?? this.budget,
        incDec: incDec ?? this.incDec,
        incdecAge: incdecAge ?? this.incdecAge,
      );

  factory RecordData.fromMap(Map<String, dynamic> json) => RecordData(
        transDay: json['trans_day'],
        revenue: json['revenue'].toDouble(),
        budget: json['budget'],
        incDec: json['inc_dec'],
        incdecAge: json['incdec_%age'],
      );

  Map<String, dynamic> toMap() => {
        'trans_day': transDay,
        'revenue': revenue,
        'budget': budget,
        'inc_dec': incDec,
        'incdec_%age': incdecAge,
      };
}
